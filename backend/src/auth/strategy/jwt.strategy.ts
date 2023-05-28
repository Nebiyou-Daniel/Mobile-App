import { Injectable } from "@nestjs/common";
import { ConfigService } from "@nestjs/config";
import { PassportStrategy } from "@nestjs/passport";
import { ExtractJwt, Strategy } from "passport-jwt";
import { PrismaService } from "src/prisma/prisma.service";

@Injectable()
export class JwtStrategy extends PassportStrategy(Strategy){
    constructor(config: ConfigService, private prisma: PrismaService){
        super({
            jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
            loginExpiration: false,
            secretOrKey: config.get('JWT_SECRET'),
        })
    }

    async validate(payload: any){ // includes sub (another way of saying id, role, email)

        const roleType = payload.role;
        // 0 for trainee, 1 for trainer and 2 for admin
        
        if (roleType == 0){

            const trainee = this.prisma.trainee.findUnique({
                where: {
                    id: payload.sub,
                }
            })
            delete (await trainee).password;
    
            return trainee;

        } else if (roleType == 1) {

            const trainer = this.prisma.trainer.findUnique({
                where: {
                    id: payload.sub,
                }
            })

            delete (await trainer).password;
        
            return trainer;

        } else if (roleType == 2){
            const admin = this.prisma.admin.findUnique({
                where: {
                    id: payload.sub,
                }
            })

            delete (await admin).password;
        
            return admin;
        }




    }

    
}
