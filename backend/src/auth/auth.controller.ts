import { Body, Controller, Post } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AdminSecondDto, loginDto, signupDto } from './dto';


@Controller('auth')
export class AuthController {
    constructor(private authService: AuthService){}

    @Post('traineeSignup')
    traineeSignup(@Body() dto: signupDto){
        return this.authService.traineeSignup(dto);
    }

    @Post('traineeLogin')
    traineeLogin(@Body() dto: loginDto){
        return this.authService.traineeLogin(dto);
    }

    @Post('trainerSignup')
    trainerSignup(@Body() dto: signupDto){
        return this.authService.trainerSignup(dto);
    }

    @Post('trainerLogin')
    trainerLogin(@Body() dto: loginDto){
        return this.authService.trainerLogin(dto);
    }

    @Post('adminLogin')
    adminLogin(@Body() dto: loginDto){
        return this.authService.adminLogin(dto);
    }

}
