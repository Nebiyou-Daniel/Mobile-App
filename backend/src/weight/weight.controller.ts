import { Body, Controller, Delete, Get, Param, ParseIntPipe, Patch, Post, UseGuards } from '@nestjs/common';
import { WeightService } from './weight.service';
import { GetTrainee, GetTrainer } from 'src/auth/decorator';
import { CreateWeightDto } from './dto';
import { JwtGuard } from 'src/auth/guard';

@UseGuards(JwtGuard)
@Controller('weight')
export class WeightController {
    constructor(private weightService: WeightService){}

    @Post('trainee')
    addWeightForTrainee(
        @GetTrainee('id') traineeId: number,
        @Body() dto: CreateWeightDto
    ){
        return this.weightService.addWeightForTrainee(traineeId, dto);
    }

    @Post('trainer')
    addWeightForTrainer(
        @GetTrainer('id') trainerId: number,
        @Body() dto: CreateWeightDto
    ){
        return this.weightService.addWeightForTrainer(trainerId, dto);
    }

    @Get('trainee')
    getAllWeightsForTrainee(
        @GetTrainee('id') traineeId: number,
    ){
        return this.weightService.getAllWeightsForTrainee(traineeId);
    }

    @Get('trainer')
    getAllWeightsForTrainer(
        @GetTrainer('id') trainerId: number,
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
