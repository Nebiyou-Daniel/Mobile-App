import { Body, Controller, Get, Patch, Req, UseGuards } from '@nestjs/common';
import { Trainee } from '@prisma/client';
import { GetTrainee } from 'src/auth/decorator';
import { JwtGuard } from 'src/auth/guard';
import { EditTraineeDto } from './dto';
import { TraineeService } from './trainee.service';

@UseGuards(JwtGuard)
@Controller('trainee')
export class TraineeController {
    constructor(private traineeService: TraineeService){}

    @Get('me')
    getMe(@GetTrainee() trainee: Trainee){ 
        return trainee;
    }

    @Patch()
    editTrainee(@GetTrainee('id') traineeid: number, @Body() dto: EditTraineeDto){
        return this.traineeService.editTrainee(traineeid, dto);
    }
    
}
