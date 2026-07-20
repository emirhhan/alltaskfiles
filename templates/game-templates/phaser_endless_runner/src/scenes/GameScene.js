import Phaser from 'phaser';

export class GameScene extends Phaser.Scene {
  constructor() { super('Game'); }

  create() {
    this.gameOver = false;
    this.scrollSpeed = 240;

    this.ground = this.physics.add.staticGroup();
    for (let x = 32; x < 832; x += 64) {
      this.ground.create(x, 560, 'ground');
    }

    this.player = this.physics.add.sprite(150, 480, 'hero');
    this.player.setCollideWorldBounds(true);
    this.physics.add.collider(this.player, this.ground);
    this.cursors = this.input.keyboard.createCursorKeys();

    this.obstacles = this.physics.add.group();
    this.physics.add.collider(this.player, this.obstacles, () => this._end(), null, this);

    this.spawnTimer = this.time.addEvent({
      delay: 1400, loop: true, callback: this._spawn, callbackScope: this
    });
  }

  update() {
    if (this.gameOver) return;
    if (this.cursors.up.isDown && this.player.body.blocked.down) {
      this.player.setVelocityY(-480);
    }
    // Zemin kayması hissi
    this.ground.children.iterate((g) => {
      if (g) { g.x -= this.scrollSpeed / 60; if (g.x < -32) g.x += 832; }
    });
  }

  _spawn() {
    if (this.gameOver) return;
    const o = this.obstacles.create(820, 520, 'obstacle');
    o.setVelocityX(-this.scrollSpeed);
    o.body.setAllowGravity(false);
  }

  _end() {
    this.gameOver = true;
    this.spawnTimer.remove();
    console.log('Oyun bitti!');
  }
}
