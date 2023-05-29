import { ForbiddenException, Injectable } from '@nestjs/common';
import { EditAdminDto } from './dto';
import { PrismaService } from 'src/prisma/prisma.service';
import * as argon from 'argon2'
import { PasswordUpdateDto } from './dto/passwordUpdate.dto';

@Injectable()
export class AdminService {
    constructor(private prisma: PrismaService){}

    async updateAdmin(adminId: number, dto: EditAdminDto){
        const admin = await this.prisma.admin.update({
            where: {
                id: adminId,
            },
            data: {
                ...dto,
            }
        });
        delete admin.password;

        return admin;
    }
    async updatePassword(adminId: number, dto: PasswordUpdateDto){
        if(adminId == null){
            throw new ForbiddenException('Not authenticated')
          }
        const pass: string = await argon.hash(dto.newPassword)
          //verify if password is correct
        const use=await this.prisma.admin.findFirst({
            where:{
                id: adminId
            }
        })
        const correct = await argon.verify(use.password, dto.oldPassword)

        if(correct){

            const returnObj= await this.prisma.admin.update({
                where:{
                    id: adminId
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
    async deleteAdmin(adminId: number){
        const admin = await this.prisma.admin.findUnique({
            where: {
                id: adminId
            }

        })
        if (!admin){
            throw new ForbiddenException('Access to resource denied')
        }
        await this.prisma.admin.delete({
            where: {
                id: adminId
            }
        })
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

}
