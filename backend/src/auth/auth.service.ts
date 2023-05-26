import { ForbiddenException, Injectable } from '@nestjs/common';
import { loginDto, signupDto } from './dto';
import * as argon from 'argon2';
import { PrismaService } from 'src/prisma/prisma.service';

@Injectable()
export class AuthService {
    constructor(private prisma: PrismaService){}


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
            return trainee;

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
            return trainer;

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
        return trainee;
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
        return trainer;
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
        return admin;
    }
}
