(function() {
  var Coin, coin,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Coin = (function(_super) {
    __extends(Coin, _super);

    function Coin() {
      return Coin.__super__.constructor.apply(this, arguments);
    }

    Coin.key = 'coin';

    return Coin;

  })(Phaser.Sprite);

  coin = new Coin;

  console.log(coin);

}).call(this);
