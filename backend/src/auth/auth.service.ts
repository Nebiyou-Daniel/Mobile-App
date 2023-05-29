import { ForbiddenException, Injectable } from '@nestjs/common';
import { loginDto, signupDto } from './dto';
import * as argon from 'argon2';
import { PrismaService } from 'src/prisma/prisma.service';
<<<<<<< HEAD
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';
import { NewTrainerApprovalDto } from './dto/new-trainer-approval.dto';

export enum Role{
    trainee,
    trainer,
    admin
}

@Injectable()
export class AuthService {
    constructor(
        private prisma: PrismaService, 
        private jwt: JwtService,
        private config: ConfigService
        ){}
=======

@Injectable()
export class AuthService {
    constructor(private prisma: PrismaService){}
>>>>>>> master


    async traineeSignup(dto: signupDto){
        // generate password hash
        const passwordHash = await argon.hash(dto.password);

        //save new user in the database
        try {
            const trainee = await this.prisma.trainee.create({
                data: {
                    email: dto.email,
                    password: passwordHash,
                    fullName: dto.fullName,
                    role: dto.role,
                }
            })
            // return saved user
            delete trainee.password;
<<<<<<< HEAD
            return this.signToken(trainee.id, trainee.email, Role.trainee);;
=======
            return trainee;
>>>>>>> master

        } catch (error) {
            throw new ForbiddenException(
                `the ${error.meta.target} credential has been taken`,
            );
        }
    }


    async trainerSignup(dto: signupDto){
        // generate password hash
        const passwordHash = await argon.hash(dto.password);

        //save new user in the database
        try {
            const trainer = await this.prisma.trainer.create({
                data: {
                    email: dto.email,
                    password: passwordHash,
                    fullName: dto.fullName,
                    role: dto.role,
                }
            })
            delete trainer.password;

            // return saved user
<<<<<<< HEAD
            return this.signToken(trainer.id, trainer.email, Role.trainer);
=======
            return trainer;
>>>>>>> master

        } catch (error) {
            throw new ForbiddenException(
                `the ${error.meta.target} credential has been taken`,
            );
        }
    }


    async traineeLogin(dto: loginDto){
        // find user by email
        const trainee = await this.prisma.trainee.findUnique({
            where: {
                email: dto.email
            }
        })
        // if user doesn't exist throw exception
        if (!trainee){
            throw new ForbiddenException(
                "email not found"
            )
        }
        // compare password
        const passwordMatches = await argon.verify(
            trainee.password,
            dto.password
        );
        // if password is incorrect, throw exception
        if (!passwordMatches){
            throw new ForbiddenException(
                "incorrect password"
            )
        }
        delete trainee.password;

        // return user
<<<<<<< HEAD
        return this.signToken(trainee.id, trainee.email, Role.trainee);
=======
        return trainee;
>>>>>>> master
    }


    async trainerLogin(dto: loginDto){
        // find user by email
        const trainer = await this.prisma.trainer.findUnique({
            where: {
                email: dto.email
            }
        })
        // if user doesn't exist throw exception
        if (!trainer){
            throw new ForbiddenException(
                "email not found"
            )
        }
        // compare password
        const passwordMatches = await argon.verify(
            trainer.password,
            dto.password
        );
        // if password is incorrect, throw exception
        if (!passwordMatches){
            throw new ForbiddenException(
                "incorrect password"
            )
        }
        delete trainer.password;

        // return user
<<<<<<< HEAD
        return this.signToken(trainer.id, trainer.email, Role.trainer);
    }


    async adminSignup(dto: signupDto){
        // generate password hash
        const passwordHash = await argon.hash(dto.password);

        //save new user in the database
        try {
            const admin = await this.prisma.admin.create({
                data: {
                    email: dto.email,
                    password: passwordHash,
                    fullName: dto.fullName,
                    role: dto.role,
                }
            })
            delete admin.password;

            // return saved user
            return this.signToken(admin.id, admin.email, Role.admin);

        } catch (error) {
            throw new ForbiddenException(
                `the ${error.meta.target} credential has been taken`,
            );
        }
=======
        return trainer;
>>>>>>> master
    }


    async adminLogin(dto: loginDto){
        // find user by email
        const admin = await this.prisma.admin.findUnique({
            where: {
                email: dto.email
            }
        })
        // if user doesn't exist throw exception
        if (!admin){
            throw new ForbiddenException(
                "email not found"
            )
        }
        // compare password
        const passwordMatches = await argon.verify(
            admin.password,
            dto.password
        );
        // if password is incorrect, throw exception
        if (!passwordMatches){
            throw new ForbiddenException(
                "incorrect password"
            )
        }
        delete admin.password;

        // return user
<<<<<<< HEAD
        return this.signToken(admin.id, admin.email, Role.admin);
    }

    
    async signToken(
        id: number, 
        email: string, 
        role: Role): Promise<{access_token: String}> {
        const payload = {
            // 'sub' means id. (it's a convention in the jwt environment)
            sub: id,
            email: email,  
            role: role          
        };

        const secret = this.config.get('JWT_SECRET')

        const token = await this.jwt.signAsync(payload, {
            expiresIn: '24h',
            secret: secret,
        })
        return {access_token: token};
    }


    async logout(){
        return {token: ''};
    }
    

    async approveNewTrainer(
        traineeId: number, 
        dto1: NewTrainerApprovalDto, 
        dto2: signupDto
    ){

        const trainee = await this.prisma.trainee.findUnique({
            where: {
                id: traineeId
            }
        })
        if (!trainee){
            throw new ForbiddenException('Access to resource denied')
        }
        const passwordHash = await argon.hash(dto2.password);

        const newTrainer = await this.prisma.trainer.create({
            data: {
                email: dto2.email,
                password: passwordHash,
                fullName: dto2.fullName,
                role: dto2.role,
                previousJobXp: dto1.previousJobXp,
                yearsOfXp: dto1.yearsOfXp,
                previousWorkPlace: dto1.previousWorkPlace
            }
        })
        delete newTrainer.password;

        await this.prisma.trainee.delete({
            where: {
                id: traineeId
            }
        })
        // return saved user
        return this.signToken(newTrainer.id, newTrainer.email, Role.trainer);
=======
        return admin;
>>>>>>> master
    }
}
