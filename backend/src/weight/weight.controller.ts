import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post } from '@nestjs/common';
import { WeightService } from './weight.service';
import { GetTrainee, GetTrainer } from 'src/auth/decorator';
import { CreateWeightDto } from './dto';

@Controller('weight')
export class WeightController {
    constructor(private weightService: WeightService){}

    @Post('trainee')
    addWeightForTrainee(
        @GetTrainee() traineeId: number,
        @Body() dto: CreateWeightDto
    ){
        return this.weightService.addWeightForTrainee(traineeId, dto);
    }

    @Post('trainer')
    addWeightForTrainer(
        @GetTrainer() trainerId: number,
        @Body() dto: CreateWeightDto
    ){
        return this.weightService.addWeightForTrainer(trainerId, dto);
    }

    @Get('trainee')
    getAllWeightsForTrainee(
        @GetTrainee() traineeId: number,
    ){
        return this.weightService.getAllWeightsForTrainee(traineeId);
    }

    @Get('trainer')
    getAllWeightsForTrainer(
        @GetTrainer() trainerId: number,
    ){
        return this.weightService.getAllWeightsForTrainer(trainerId);
    }

    @Patch(':id')
    updateWeightById(
        @Param('id', ParseIntPipe) weightId: number
    ){}

    @Delete(':id')
    deleteWeightById(
        @Param('id', ParseIntPipe) weightId: number
    ){}
}
