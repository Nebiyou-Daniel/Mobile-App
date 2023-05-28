import {createParamDecorator, ExecutionContext} from '@nestjs/common';

export const GetTrainee = createParamDecorator(
    (data: string | undefined, ctx: ExecutionContext) => {
        const request: Express.Request = ctx.switchToHttp().getRequest();
        if (data){
            return request.user[data];
        }
        return request.user;
    }
)
export const GetTrainer = createParamDecorator(
    (data: string | undefined, ctx: ExecutionContext) => {
        const request: Express.Request = ctx.switchToHttp().getRequest();
        if (data){
            return request.user[data];
        }
        return request.user;
    }
)
export const GetAdmin = createParamDecorator(
    (data: string | undefined, ctx: ExecutionContext) => {
        const request: Express.Request = ctx.switchToHttp().getRequest();
        if (data){
            return request.user[data];
        }
        return request.user;
    }
)
