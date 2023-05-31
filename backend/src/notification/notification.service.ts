import { ForbiddenException, Injectable } from '@nestjs/common';
import { Task, Trainee, Trainer } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class NotificationService {
    constructor(private prisma: PrismaService){}

    async newTaskNotification(trainerId: number, task: Task){
        const notify = await this.prisma.notification.create({
            data: {
                trainerId: trainerId,
                title:"You Have a NEW Task!",
                details: `On ${task.createdAt}, you are given the task '${task.taskName}', get to work!`
            }
        })
        return notify;
    }

    async taskEditedNotification(trainerId: number, task: Task){
        const notify = await this.prisma.notification.create({
            data: {
                trainerId,
                title: `You have an updated task!`,
                details: `'${task.taskName}' to be done on ${task.createdAt} has been updated by your trainer so please go and check it out.`
            }
        })
        return notify;
    }

    async taskDoneNotification(trainee: Trainee, task: Task){
        const notify = await this.prisma.notification.create({
            data: {
                traineeId: trainee.id,
                title: `'${trainee.fullName}' has completed the given task!`,
                details: `Your trainee '${trainee.fullName}' has completed the task '${task.taskName}' given on ${task.createdAt}. Please make a new one!`
            }
        })
        return notify;
    }

    async newTraineeNotification(trainee: Trainee){
        const notify = await this.prisma.notification.create({
            data: {
                traineeId: trainee.id,
                title: `You have a NEW Trainee!`,
                details: `Trainee '${trainee.fullName}' has joined you, make sure to train them well.`
            }
        })
        return notify;
    }
    // async newTrainerApplication(trainer: Trainer){
    //     const notify = await this.prisma.notification.create({
    //         data: {
    //             trainerId,
    //             title: `You have a Trainee applying to be a Trainer!`,
    //             details: `Trainee ${trainer.fullName} is applying to become a trainer. Approve or Decline the request.`
    //         }
    //     })
    //     return notify;
    // }
    // async applicationDecision(adminId: number){
    //     const notify = await this.prisma.notification.create({
    //         data: {
    //             adminId,
    //             title: `Your Application to become Trainer has been Processed!`,
    //             details: `Your application has been {accepted/declined}...`
    //         }
    //     })
    //     return notify;
    // }

    async getTraineeReadNotification(traineeId: number){
        const notify = await this.prisma.notification.findMany({
            where: {
                traineeId,
                markAsRead: true
            }
        })
        return notify;
    }

    async getTraineeUnreadNotification(traineeId: number){
        const notify = await this.prisma.notification.findMany({
            where: {
                traineeId,
                markAsRead: false
            }
        })
        return notify;
    }

    async getTraineeAllNotification(traineeId: number){
        const notify = await this.prisma.notification.findMany({
            where: {
                traineeId,
            }
        })
        return notify;
    }

    async getTrainerReadNotification(trainerId: number){
        const notify = await this.prisma.notification.findMany({
            where: {
                trainerId,
                markAsRead: true
            }
        })
        return notify;
    }

    async getTrainerUnreadNotification(trainerId: number){
        const notify = await this.prisma.notification.findMany({
            where: {
                trainerId,
                markAsRead: false
            }
        })
        return notify;
    }

    async getTrainerAllNotification(trainerId: number){
        const notify = await this.prisma.notification.findMany({
            where: {
                trainerId,
            }
        })
        return notify;
    }

    async markTraineeAsRead(traineeId: number){
        const notify = await this.prisma.notification.findUnique({
            where: {
                id: traineeId
            }

        })
        if (!notify || notify.traineeId !== traineeId){
            throw new ForbiddenException('Access to resource denied')
        }

        return this.prisma.notification.update({
            where: {
                id: traineeId
            },
            data: {
                markAsRead: true
            }
        })       
    }
    async markTrainerAsRead(trainerId: number){
        const notify = await this.prisma.notification.findUnique({
            where: {
                id: trainerId
            }

        })
        if (!notify || notify.trainerId !== trainerId){
            throw new ForbiddenException('Access to resource denied')
        }

        return this.prisma.notification.update({
            where: {
                id: trainerId
            },
            data: {
                markAsRead: true
            }
        })       
    }

    async markAsRead(notificationId: number){
        return this.prisma.notification.update({
            where: {
                id: notificationId
            },
            data: {
                markAsRead: true
            }
        })          
    }

    async deleteNotification(notificationId: number){
        return this.prisma.notification.delete({
            where: {
                id: notificationId,
            }
        })       
    }
    
}
