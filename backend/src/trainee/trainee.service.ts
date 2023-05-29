import { ForbiddenException, Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { EditTraineeDto } from './dto';
import { PasswordUpdateDto } from './dto/passwordUpdate.dto';
import * as argon from 'argon2'
import { NewTrainerDto } from './dto/new-trainer.dto';


@Injectable()
export class TraineeService {
    constructor(private prisma: PrismaService){}

    async updateTrainee(traineeId: number, dto: EditTraineeDto){
        const trainee = await this.prisma.trainee.update({
            where: {
                id: traineeId,
            },
            data: {
                ...dto,
            }
        });
        delete trainee.password;

        return trainee;
    }

    async updatePassword(traineeId: number, dto: PasswordUpdateDto){
        if(traineeId == null){
            throw new ForbiddenException('Not authenticated')
          }
        const pass: string = await argon.hash(dto.newPassword)
          //verify if password is correct
        const use=await this.prisma.trainee.findFirst({
            where:{
                id: traineeId
            }
        })
        const correct = await argon.verify(use.password,dto.oldPassword)

        if(correct){

            const returnObj= await this.prisma.trainee.update({
                where:{
                    id: traineeId
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

    async deleteTrainee(traineeId: number){
        const trainee = await this.prisma.trainee.findUnique({
            where: {
                id: traineeId
            }

        })
        if (!trainee){
            throw new ForbiddenException('Access to resource denied')
        }
        await this.prisma.trainee.delete({
            where: {
                id: traineeId
            }
        })
    }

    async newTrainer(traineeId: number, dto: NewTrainerDto){
        const trainee = await this.prisma.trainee.update({
            where: {
                id: traineeId,
            },
            data: {
                ...dto,
            }
        });
        delete trainee.password;

        return trainee;
    }

    async getMyTrainerById(traineeId: number){
        const trainee = await this.prisma.trainee.findFirst({
            where: {
                id: traineeId,
            },
            select: {
                id: true,
                trainerId: true
            }
        });

        return trainee;
    }

    async removeTrainer(traineeId: number){
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
