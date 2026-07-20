import Phaser from 'phaser';

export class GameScene extends Phaser.Scene {
  constructor() { super('Game'); }

  create() {
    // Zemin
    this.platforms = this.physics.add.staticGroup();
    for (let x = 32; x < 800; x += 64) {
      const p = this.platforms.create(x, 580, 'ground');
    }

    // Oyuncu
    this.player = this.physics.add.sprite(100, 400, 'hero');
    this.player.setCollideWorldBounds(true);
    this.physics.add.collider(this.player, this.platforms);

    // Kamera
    this.cameras.main.setBounds(0, 0, 800, 600);
    this.cameras.main.startFollow(this.player, true, 0.08, 0.08);

    // Girdi
    this.cursors = this.input.keyboard.createCursorKeys();
  }

  update() {
    const speed = 220;
    const onFloor = this.player.body.blocked.down || this.player.body.touching.down;
    if (this.cursors.left.isDown) {
      this.player.setVelocityX(-speed);
    } else if (this.cursors.right.isDown) {
      this.player.setVelocityX(speed);
    } else {
      this.player.setVelocityX(0);
    }
    if (this.cursors.up.isDown && onFloor) {
      this.player.setVelocityY(-500);
    }
  }
}
