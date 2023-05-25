import { Injectable } from '@nestjs/common';

@Injectable()
export class AuthService {

    signup(){
        return {msg: "Signup"};
    }

    login(){
        return {msg: "login"};
    }
}
