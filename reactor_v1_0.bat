@echo off
if [%1]==[] goto failed
@echo ----- Reactor - React app quick setup script v1.0 -----
@echo Creating directory %1...
mkdir %1
cd %1
@echo Initializing package.json...
call npm init -f --silent
@echo Installing React components...
call npm i -S react react-dom --silent
@echo Installing Babel components...
call npm i -D babel-core babel-loader babel-preset-react --silent
@echo Configuring Babel...
@echo {presets: ['react']} > .babelrc
@echo Installing Webpack components...
call npm i -D webpack webpack-dev-server html-webpack-plugin --silent
@echo Configuring Webpack...
@echo var HTMLWebpackPlugin = require('html-webpack-plugin'); > webpack.config.js
@echo var HTMLWebpackPluginConfig = new HTMLWebpackPlugin( >> webpack.config.js
@echo   { >> webpack.config.js
@echo     template: __dirname +'/app/index.html', >> webpack.config.js
@echo     filename: 'index.html', >> webpack.config.js
@echo     inject: 'body' >> webpack.config.js
@echo   } >> webpack.config.js
@echo ); >> webpack.config.js
@echo module.exports = { >> webpack.config.js
@echo   entry: __dirname + '/app/main.js', >> webpack.config.js
@echo   module: { >> webpack.config.js
@echo     loaders: [ >> webpack.config.js
@echo       { >> webpack.config.js
@echo         test: /\.js$/, >> webpack.config.js
@echo         exclude: /node_modules/, >> webpack.config.js
@echo         loader: 'babel-loader', >> webpack.config.js
@echo       } >> webpack.config.js
@echo     ] >> webpack.config.js
@echo   }, >> webpack.config.js
@echo   output: { >> webpack.config.js
@echo     filename: 'main.js', >> webpack.config.js
@echo     path: __dirname + '/build' >> webpack.config.js
@echo   }, >> webpack.config.js
@echo   plugins: [HTMLWebpackPluginConfig] >> webpack.config.js
@echo }; >> webpack.config.js
@echo Creating /app directory...
mkdir app
cd app
@echo Creating index.html...
@echo ^<!DOCTYPE html^> > index.html
@echo ^<html lang="en"^> >> index.html
@echo ^<head^> >> index.html
@echo   ^<meta charset="UTF-8"^> >> index.html
@echo   ^<title^>%1 - A React App^</title^> >> index.html
@echo ^</head^> >> index.html
@echo ^<body^> >> index.html
@echo   ^<div id="app"^>^</div^> >> index.html
@echo ^</body^> >> index.html
@echo ^</html^> >> index.html
@echo Creating main.js...
@echo var React = require('react'); >> main.js
@echo var ReactDOM = require('react-dom'); >> main.js
@echo var App = require('./components/App'); >> main.js
@echo ReactDOM.render( >> main.js
@echo   ^<App /^>, >> main.js
@echo   document.getElementById('app') >> main.js
@echo ); >> main.js
@echo Creating /app/components directory...
mkdir components
@cd components
@echo var React = require('react'); > App.js
@echo var App = React.createClass( >> App.js
@echo   { >> App.js
@echo     render : function () { >> App.js
@echo       return ( >> App.js
@echo         ^<div^> >> App.js
@echo           ^<h1^>%1 - A React App^</h1^> >> App.js
@echo           ^<p^>If you see this text when you run your app, everything was setup properly.^</p^> >> App.js
@echo         ^</div^> >> App.js
@echo       ); >> App.js
@echo     } >> App.js
@echo   } >> App.js
@echo ); >> App.js
@echo module.exports = App; >> App.js
cd ..
cd ..
@echo Building %1...
call "node_modules/.bin/webpack"
@echo Setup complete! You can now start working on your awesome React App!

cd ..
goto finished
:failed
@echo Usage %0 [project_name]
exit /B 1
:finished
exit /B 0