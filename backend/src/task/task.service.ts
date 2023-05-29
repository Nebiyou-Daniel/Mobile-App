import { ForbiddenException, Injectable } from '@nestjs/common';
import { CreateTaskDto, EditTaskDto } from './dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class TaskService {
    constructor(private prisma: PrismaService){}

    async createTask(trainerId: number, dto: CreateTaskDto){
        const task = await this.prisma.task.create({
            data: {
                trainerId,
                traineeId: dto.traineeId,
                ...dto
            }
        })
        return task;
    }

    // getAllTasks(trainerId: number){
    //     return this.prisma.task.findMany({
    //         where: {
    //             trainerId
    //         }
    //     })
    // }

    getTaskById(trainerId: number, taskId: number){
        return this.prisma.task.findFirst({
            where: {
                id: taskId,
                trainerId
            }
        })        
    }

    async editTaskById(trainerId: number, taskId: number, dto: EditTaskDto){
        const task = await this.prisma.task.findUnique({
            where: {
                id: taskId
            }

        })
        if (!task || task.trainerId !== trainerId){
            throw new ForbiddenException('Access to resource denied')
        }

        return this.prisma.task.update({
            where: {
                id: taskId
            },
            data: {
                ...dto
            }
        })
    }

    async deleteTaskById(trainerId: number, taskId: number){
        const task = await this.prisma.task.findUnique({
            where: {
                id: taskId
            }

        })
        if (!task || task.trainerId !== trainerId){
            throw new ForbiddenException('Access to resource denied')
        }
        await this.prisma.task.delete({
            where: {
                id: taskId
            }
        })
    }
}
