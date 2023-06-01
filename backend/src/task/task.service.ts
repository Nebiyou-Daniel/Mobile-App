import { ForbiddenException, Injectable } from '@nestjs/common';
import { CreateTaskDto, EditTaskDto, GetTaskDto, GetTaskDtoTrainee } from './dto';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class TaskService {
    getTaskByDateTrainee(traineeId: number, dto: GetTaskDtoTrainee) {
        return this.prisma.task.findFirst({
            where: {
                traineeId: traineeId,
                trainerId: dto.trainerId,
                assignedDate: dto.assignedDate
            }
        }) ;
    }
    getTaskByDate(trainerId: number, dto: GetTaskDto) {
        return this.prisma.task.findFirst({
            where: {
                trainerId: trainerId,
                traineeId: dto.traineeId,
                assignedDate: dto.assignedDate
            }
        })  
    }
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
        if (task.taskDone){
            throw new ForbiddenException('You can not change a task that is done by the trainee. Create new task for the trainee.')
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
    async setTaskAsDone(traineeId: number, taskId: number, dto: EditTaskDto){
        const task = await this.prisma.task.findUnique({
            where: {
                id: taskId
            }

        })
        if (!task || task.traineeId !== traineeId){
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
}
