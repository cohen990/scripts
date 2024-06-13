#! /bin/bash

npm init -y

npm install --save-dev @typescript-eslint/parser @typescript-eslint/eslint-plugin eslint typescript @types/jest jest ts-jest

echo '{
  "compilerOptions": {
    "module": "nodenext",
    "esModuleInterop": true,
    "target": "esnext",
    "moduleResolution": "node",
    "sourceMap": true,
    "outDir": "dist"
  }
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

sed -i "s/\"test\":.*/\"test\": \"jest\"/" package.json

npx jest

