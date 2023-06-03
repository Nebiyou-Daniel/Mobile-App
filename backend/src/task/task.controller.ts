import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, UseGuards } from '@nestjs/common';
import { TaskService } from './task.service';
import { JwtGuard } from 'src/auth/guard';
import { GetTrainee, GetTrainer } from 'src/auth/decorator';
import { CreateTaskDto, EditTaskDto } from './dto';

@UseGuards(JwtGuard)
@Controller('task')
export class TaskController {
    constructor(private taskService: TaskService){}

    @Post()
    createTask(
        @GetTrainer('id') trainerId: number, 
        @Body() dto: CreateTaskDto
    ){
        return this.taskService.createTask(trainerId, dto);
    }
    
    // @Get()
    // getAllTasks(
    //     @GetTrainee('id') traineeId: number
    // ){
    //     return this.taskService.getAllTasks(traineeId);
    // }
    @Get('trainer/:id/:date')
    getTaskByDateForTrainer(
        @GetTrainer('id') trainerId: number,
        @Param('date') date: string,
        @Param('id', ParseIntPipe) traineeId: number
    ){
        return this.taskService.getTaskByDate(trainerId, traineeId, date)
    }

    @Get('trainee/:date')
    getTaskByDateForTrainee(
        @GetTrainee('id') traineeId: number,
        @Param('date') date: string
    ){
        return this.taskService.getTaskByDateTrainee(traineeId, date)
    }
    
    @Get(':id')
    getTaskById(
        @GetTrainer('id') trainerId: number,
        @Param('id', ParseIntPipe) taskId: number
    ){
        return this.taskService.getTaskById(trainerId, taskId);
    }


    @Patch(':id')
    editTaskById(
        @GetTrainer('id') trainerId: number,
        @Param('id', ParseIntPipe) taskId: number,
        @Body() dto: EditTaskDto
    ){
        return this.taskService.editTaskById(trainerId, taskId, dto);
    }

    @Delete(':id')
    deleteTaskById(
        @GetTrainer('id') trainerId: number,
        @Param('id', ParseIntPipe) taskId: number
    ){
        return this.taskService.deleteTaskById(trainerId, taskId);
    }

    @Patch(':id/taskDone')
    setTaskAsDone(
        @GetTrainee('id') traineeId: number,
        @Param('id', ParseIntPipe) taskId: number,
        @Body() dto: EditTaskDto
    ){
        return this.taskService.setTaskAsDone(traineeId, taskId, dto);
    }


}
