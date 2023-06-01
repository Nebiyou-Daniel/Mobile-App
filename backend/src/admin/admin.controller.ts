import { Body, Controller, Delete, Get, Patch, Post, UseGuards } from '@nestjs/common';
import { AdminService } from './admin.service';
import { GetAdmin, GetTrainee, GetTrainer } from 'src/auth/decorator';
import { Admin } from '@prisma/client';
import { EditAdminDto } from './dto';
import { JwtGuard } from 'src/auth/guard';
import { PasswordUpdateDto } from './dto/passwordUpdate.dto';

@UseGuards(JwtGuard)
@Controller('admin')
export class AdminController {
    constructor(private adminService: AdminService){}

    @Get('me')
    getMe(@GetAdmin() admin: Admin){ 
        return admin;
    }

    @Patch('/profile')
    editTrainee(@GetAdmin('id') adminId: number, @Body() dto: EditAdminDto){
        return this.adminService.updateAdmin(adminId, dto);
    }
    @Patch('/password')
    updatePassword(@GetAdmin('id') adminId: number, @Body() dto: PasswordUpdateDto){
        return this.adminService.updatePassword(adminId, dto);
    }
    @Delete('deleteAdmin')    
    deleteAdmin(@GetAdmin('id') adminId: number){
        return this.adminService.deleteAdmin(adminId);
    }
    @Delete('deleteTrainee')    
    deleteTrainee(@GetTrainee('id') traineeId: number){
        return this.adminService.deleteTrainee(traineeId);
    }
    @Delete('deleteTrainer')    
    deleteTrainer(@GetTrainer('id') trainerId: number){
        return this.adminService.deleteTrainer(trainerId);
    }
}
