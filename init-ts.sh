#! /bin/bash

npm init -y

npm install --save-dev @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint typescript @types/jest jest ts-jest

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

echo 'module.exports = {
  extends: ['eslint:recommended', 'plugin:@typescript-eslint/recommended'],
  parser: '@typescript-eslint/parser',
  plugins: ['@typescript-eslint'],
  root: true,
};' > .eslintrc.cjs

./node_modules/.bin/tslint --init
mv tslint.json .tslintrc

mkdir src
touch src/app.ts
echo "expect(true).toBe(false);" > src/app.test.ts

npx ts-jest config:init
npx jest
