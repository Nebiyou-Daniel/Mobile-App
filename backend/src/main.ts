import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import * as cors from 'cors';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // Enable CORS
  app.use(cors());

  // Apply global validation pipe
  app.useGlobalPipes(new ValidationPipe({ whitelist: true }));

  await app.listen(3050);
}
bootstrap();
