import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class NotificationService {
    constructor(private prisma: PrismaService){}

    async newTaskNotification(trainerId: number){
        const notify = await this.prisma.notification.create({
            data: {
                trainerId,
                title: "New Task has been Created For You!",
                details: "On {dateCreated}, you are set to do the task '{task}'. Good Luck!"
            }
        })
        return notify;
    }

    async taskEditedNotification(trainerId: number, taskId: number){
        const notify = await this.prisma.notification.create({
            data: {
                trainerId,
                title: "You have an updated task!",
                details: "{task} to be done on {dateCreated} has been updated by your trainer so please go and check it out."
            }
        })
        return notify;
    }

    async taskDoneNotification(traineeId: number, taskId: number){
        const notify = await this.prisma.notification.create({
            data: {
                traineeId,
                title: "{trainee} has completed the given task!",
                details: "Your trainee {traineeName} has completed the task '{task}' given on {dateCreated}. Please make a new one!"
            }
        })
        return notify;
    }

    async newTraineeNotification(traineeId: number){
        const notify = await this.prisma.notification.create({
            data: {
                traineeId,
                title: "You have a NEW Trainee!",
                details: "Trainee {traineeName} has joined you, make sure to train them well."
            }
        })
        return notify;
    }
    async newTrainerApplication(trainerId: number){
        const notify = await this.prisma.notification.create({
            data: {
                trainerId,
                title: "You have a Trainee applying to be a Trainer!",
                details: "Trainee {traineeName} is applying to become a trainer. Approve or Decline the request."
            }
        })
        return notify;
    }
    async applicationDecision(adminId: number){
        const notify = await this.prisma.notification.create({
            data: {
                adminId,
                title: "Your Application to become Trainer has been Processed!",
                details: "Your application has been {accepted/declined}..."
            }
        })
        return notify;
    }

    
}
