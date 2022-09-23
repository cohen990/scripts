!# /bin/bash

npm init -y

npm install -D typescript
npm install -D tslint

npm install express -S
npm install @types/express -D

echo '{
  "compilerOptions": {
    "module": "commonjs",
    "esModuleInterop": true,
    "target": "es6",
    "moduleResolution": "node",
    "sourceMap": true,
    "outDir": "dist"
  },
  "lib": ["es2015"]
}' > tsconfig.json

./node_modules/.bin/tslint --init

mkdir src
touch src/app.ts
echo "expect(true).toBe(false);" > src/app.test.ts

npm install -D jest
npm install -D ts-jest
npx ts-jest config:init
npx jest
