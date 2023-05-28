import { Body, Controller, Delete, Get, HttpCode, HttpStatus, Post, Res } from '@nestjs/common';
import { AuthService } from './auth.service';
import { loginDto, signupDto } from './dto';
import { GetTrainee } from './decorator';
import { NewTrainerApprovalDto } from './dto/new-trainer-approval.dto';


@Controller('auth')
export class AuthController {
    constructor(private authService: AuthService){}

    @Post('traineeSignup')
    traineeSignup(@Body() dto: signupDto){
        return this.authService.traineeSignup(dto);
    }
    
    @HttpCode(HttpStatus.OK)
    @Post('traineeLogin')
    traineeLogin(@Body() dto: loginDto){
        return this.authService.traineeLogin(dto);
    }

    @Post('trainerSignup')
    trainerSignup(@Body() dto: signupDto){
        return this.authService.trainerSignup(dto);
    }

    @HttpCode(HttpStatus.OK)
    @Post('trainerLogin')
    trainerLogin(@Body() dto: loginDto){
        return this.authService.trainerLogin(dto);
    }

    @Post('adminSignup')
    adminSignup(@Body() dto: signupDto){
        return this.authService.adminSignup(dto);
    }

    @HttpCode(HttpStatus.OK)
    @Post('adminLogin')
    adminLogin(@Body() dto: loginDto){
        return this.authService.adminLogin(dto);
    }

    @Get('logout')
    logout(){
        return this.authService.logout();
    }
    @Post('approve')
    approveNewTrainer(
        @GetTrainee('id') traineeId: number, 
        @Body() dto1: NewTrainerApprovalDto, 
        @Body() dto2: signupDto
    ){
        return this.authService.approveNewTrainer(traineeId, dto1, dto2);
    }
}
