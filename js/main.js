'use strict';

var gameWidth = window.innerWidth,
    gameHeight = window.innerHeight;

var game = new Phaser.Game(gameWidth, gameHeight, Phaser.AUTO, '');

game.state.add('Boot', ZenvaRunner.Boot);
game.state.add('Preload', ZenvaRunner.Preload);
game.state.add('MainMenu', ZenvaRunner.MainMenu);
game.state.add('Game', ZenvaRunner.Game);

game.state.start('Boot');
