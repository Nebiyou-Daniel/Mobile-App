import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, UseGuards } from '@nestjs/common';
import { JwtGuard } from 'src/auth/guard';
import { TrainerService } from './trainer.service';
import { GetTrainee, GetTrainer } from 'src/auth/decorator';
import { Trainer } from '@prisma/client';
import { EditTrainerDto } from './dto';
import { PasswordUpdateDto } from './dto/passwordUpdate.dto';

@UseGuards(JwtGuard)
@Controller('trainer')
export class TrainerController {
    constructor(private trainerService: TrainerService){}

    @Get('me')
    getMe(@GetTrainer() trainer: Trainer){ 
        return trainer;
    }

    @Get('/myTrainees')
    getMyTrainees(@GetTrainer('id') trainerId: number){
        return this.trainerService.getMyTrainees(trainerId);
    }
    @Get('/myTrainees/:id')
    getMyTraineeById(@GetTrainer('id') trainerId: number,
    @Param('id', ParseIntPipe) traineeId: number){
        return this.trainerService.getMyTraineeById(trainerId, traineeId);
    }
    
    @Patch('/removeTrainee')
    removeTraineeById(@GetTrainee('id') traineeId: number){
        return this.trainerService.removeTraineeById(traineeId);
    }

    @Patch('/profile')
    editTrainer(@GetTrainer('id') trainerId: number, @Body() dto: EditTrainerDto){
        return this.trainerService.updateTrainer(trainerId, dto);
    }
    @Patch('/password')
    updatePassword(@GetTrainer('id') trainerId: number, @Body() dto: PasswordUpdateDto){
        return this.trainerService.updatePassword(trainerId, dto);
    }
    @Delete()
    deleteTrainer(@GetTrainer('id') trainerId: number){
        return this.trainerService.deleteTrainer(trainerId);
    }
}
