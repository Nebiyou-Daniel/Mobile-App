import { Controller, Param, Post } from '@nestjs/common';
import { NotificationService } from './notification.service';
import { GetAdmin, GetTask, GetTrainee, GetTrainer } from 'src/auth/decorator';

@Controller('notification')
export class NotificationController {
    constructor(private notificationService: NotificationService){}

    @Post('newTask')
    newTaskNotification(
        @GetTrainer() trainerId: number,
    ){
        return this.notificationService.newTaskNotification(trainerId);
    }

    @Post('taskEdited')
    taskEditedNotification(
        @GetTrainer() trainerId: number,
        @GetTask() taskId: number

    ){
        return this.notificationService.taskEditedNotification(trainerId, taskId);
    }

    @Post('taskDone')
    taskDoneNotification(
        @GetTrainee() traineeId: number,
        @GetTask() taskId: number
    ){
        return this.notificationService.taskDoneNotification(traineeId, taskId);
    }

    @Post('newTrainee')
    newTraineeJoinedNotification(
        @GetTrainee() traineeId: number,
    ){
        return this.notificationService.newTraineeNotification(traineeId);
    }

    @Post()
    newTrainerApplication(
        @GetTrainer() trainerId: number,
    ){
        return this.notificationService.newTrainerApplication(trainerId);
    }

    @Post()
    applicationDecision(
        @GetAdmin() adminId: number,
    ){
        return this.notificationService.applicationDecision(adminId);
    }
}
