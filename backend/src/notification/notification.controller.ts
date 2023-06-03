import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, UseGuards } from '@nestjs/common';
import { NotificationService } from './notification.service';
import { GetTrainee, GetTrainer } from 'src/auth/decorator';
import { Task, Trainee } from '@prisma/client';
import { JwtGuard } from 'src/auth/guard';

@UseGuards(JwtGuard)
@Controller('notification')
export class NotificationController {
    constructor(private notificationService: NotificationService){}

    @Post('newTask')
    newTaskNotification(
        @GetTrainer('id') trainerId: number,
        @Body() task: Task
    ){
        return this.notificationService.newTaskNotification(trainerId, task);
    }    

    @Post('taskEdited')
    taskEditedNotification(
        @GetTrainer('id') trainerId: number,
        @Body() task: Task

    ){
        return this.notificationService.taskEditedNotification(trainerId, task);
    }

    @Post('taskDone')
    taskDoneNotification(
        @GetTrainee() trainee: Trainee,
        @Body() task: Task
    ){
        return this.notificationService.taskDoneNotification(trainee, task);
    }

    @Post('newTrainee')
    newTraineeJoinedNotification(
        @GetTrainee() trainee: Trainee,
    ){
        return this.notificationService.newTraineeNotification(trainee);
    }

    // @Post('newTrainer')
    // newTrainerApplication(
    //     @GetTrainer() trainerId: number,
    // ){
    //     return this.notificationService.newTrainerApplication(trainerId);
    // }

    // @Post('applicationDecision')
    // applicationDecision(
    //     @GetAdmin() adminId: number,
    // ){
    //     return this.notificationService.applicationDecision(adminId);
    // }

    @Get('traineeRead')
    getTraineeReadNotification(
        @GetTrainee('id') traineeId: number,
    ){
        return this.notificationService.getTraineeReadNotification(traineeId);
    }
    @Get('traineeUnread')
    getTraineeUnreadNotification(
        @GetTrainee('id') traineeId: number,
    ){
        return this.notificationService.getTraineeUnreadNotification(traineeId);       
    }
    @Get('traineeAll')
    getTraineeAllNotification(
        @GetTrainee('id') traineeId: number,
    ){
        return this.notificationService.getTraineeAllNotification(traineeId);        
    }
    @Get('trainerRead')
    getTrainerReadNotification(
        @GetTrainer('id') trainerId: number,
    ){
        return this.notificationService.getTrainerReadNotification(trainerId);
    }
    @Get('trainerUnread')
    getTrainerUnreadNotification(
        @GetTrainer('id') trainerId: number,
    ){
        return this.notificationService.getTrainerUnreadNotification(trainerId);        
    }
    @Get('trainerAll')
    getTrainerAllNotification(
        @GetTrainer('id') trainerId: number,
    ){
        return this.notificationService.getTrainerAllNotification(trainerId);        
    }

    @Patch(':id/markAsRead')
    markAsRead(@Param('id', ParseIntPipe) notificationId: number){
        return this.notificationService.markAsRead(notificationId);
    }

    @Delete(':id')
    deleteNotification(@Param('id', ParseIntPipe) notificationId: number){
        return this.notificationService.deleteNotification(notificationId);
    }
    
    

}
import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, UseGuards } from '@nestjs/common';
import { NotificationService } from './notification.service';
import { GetTrainee, GetTrainer } from 'src/auth/decorator';
import { Task, Trainee, Trainer } from '@prisma/client';
import { JwtGuard } from 'src/auth/guard';

@UseGuards(JwtGuard)
@Controller('notification')
export class NotificationController {
    constructor(private notificationService: NotificationService){}

    @Post('newTask')
    newTaskNotification(
        @GetTrainer('id') trainerId: number,
        @Body() task: Task
    ){
        return this.notificationService.newTaskNotification(trainerId, task);
    }    

    @Post('taskEdited')
    taskEditedNotification(
        @GetTrainer('id') trainerId: number,
        @Body() task: Task

    ){
        return this.notificationService.taskEditedNotification(trainerId, task);
    }

    @Post('taskDone')
    taskDoneNotification(
        @GetTrainee() trainee: Trainee,
        @Body() task: Task
    ){
        return this.notificationService.taskDoneNotification(trainee, task);
    }

    @Post('newTrainee')
    newTraineeJoinedNotification(
        @GetTrainee() trainee: Trainee,
    ){
        return this.notificationService.newTraineeNotification(trainee);
    }

    // @Post('newTrainer')
    // newTrainerApplication(
    //     @GetTrainer() trainerId: number,
    // ){
    //     return this.notificationService.newTrainerApplication(trainerId);
    // }

    // @Post('applicationDecision')
    // applicationDecision(
    //     @GetAdmin() adminId: number,
    // ){
    //     return this.notificationService.applicationDecision(adminId);
    // }

    @Get('traineeRead')
    getTraineeReadNotification(
        @GetTrainee('id') traineeId: number,
    ){
        return this.notificationService.getTraineeReadNotification(traineeId);
    }
    @Get('traineeUnread')
    getTraineeUnreadNotification(
        @GetTrainee('id') traineeId: number,
    ){
        return this.notificationService.getTraineeUnreadNotification(traineeId);       
    }
    @Get('traineeAll')
    getTraineeAllNotification(
        @GetTrainee('id') traineeId: number,
    ){
        return this.notificationService.getTraineeAllNotification(traineeId);        
    }
    @Get('trainerRead')
    getTrainerReadNotification(
        @GetTrainer('id') trainerId: number,
    ){
        return this.notificationService.getTrainerReadNotification(trainerId);
    }
    @Get('trainerUnread')
    getTrainerUnreadNotification(
        @GetTrainer('id') trainerId: number,
    ){
        return this.notificationService.getTrainerUnreadNotification(trainerId);        
    }
    @Get('trainerAll')
    getTrainerAllNotification(
        @GetTrainer('id') trainerId: number,
    ){
        return this.notificationService.getTrainerAllNotification(trainerId);        
    }

    @Patch(':id/markAsRead')
    markAsRead(@Param('id', ParseIntPipe) notificationId: number){
        return this.notificationService.markAsRead(notificationId);
    }

    @Delete(':id')
    deleteNotification(@Param('id', ParseIntPipe) notificationId: number){
        return this.notificationService.deleteNotification(notificationId);
    }
    
    

}
