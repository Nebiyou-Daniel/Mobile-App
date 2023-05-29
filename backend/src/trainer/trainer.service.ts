import { ForbiddenException, Injectable } from '@nestjs/common';
import { EditTrainerDto } from './dto';
import { PrismaService } from 'src/prisma/prisma.service';
import { PasswordUpdateDto } from './dto/passwordUpdate.dto';
import * as argon from 'argon2'
import { Trainee } from '@prisma/client';


@Injectable()
export class TrainerService {
    constructor(private prisma: PrismaService){}

    async updateTrainer(trainerId: number, dto: EditTrainerDto){
        const trainer = await this.prisma.trainer.update({
            where: {
                id: trainerId,
            },
            data: {
                ...dto,
            }
        });
        delete trainer.password;

        return trainer;
    }
    
    async updatePassword(trainerId: number, dto: PasswordUpdateDto){
        if(trainerId == null){
            throw new ForbiddenException('Not authenticated')
          }
        const pass: string = await argon.hash(dto.newPassword)
          //verify if password is correct
        const use=await this.prisma.trainer.findFirst({
            where:{
                id: trainerId
            }
        })
        const correct = await argon.verify(use.password,dto.oldPassword)

        if(correct){

            const returnObj= await this.prisma.trainer.update({
                where:{
                    id: trainerId
                },
                data:{
                    password: pass
                }
            })
            delete returnObj.password

            return returnObj
        } else {
            throw new ForbiddenException('Old password is wrong')
        }
    }
    async deleteTrainer(trainerId: number){
        const trainer = await this.prisma.trainer.findUnique({
            where: {
                id: trainerId
            }

        })
        if (!trainer){
            throw new ForbiddenException('Access to resource denied')
        }
        await this.prisma.trainer.delete({
            where: {
                id: trainerId
            }
        })
    }
    async getMyTrainees(trainerId: number){

        const trainees = await this.prisma.trainee.findMany({
            where: {
                trainerId: trainerId,
            },
            select: {
                id: true,
                fullName: true,
                email: true,
                bio: true,
                phoneNumber: true
            }
        });
        return trainees;
    }

    async removeTraineeById(traineeId: number){
        const trainee = await this.prisma.trainee.update({
            where: {
                id: traineeId,
            },
            data: {
                trainerId: null,
            }
        });
        delete trainee.password;

        return trainee;        
    }
}
