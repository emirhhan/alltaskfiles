import Phaser from 'phaser';

export class GameScene extends Phaser.Scene {
  constructor() { super('Game'); }

  create() {
    this.player = this.physics.add.sprite(400, 300, 'hero');
    this.player.setCollideWorldBounds(true);
    this.cursors = this.input.keyboard.createCursorKeys();

    // Object pool
    this.enemies = this.physics.add.group({ defaultKey: 'enemy', maxSize: 40 });

    this.spawnTimer = this.time.addEvent({
      delay: 800, loop: true, callback: this._spawn, callbackScope: this
    });
  }

  update() {
    const speed = 220;
    const dir = new Phaser.Math.Vector2(
      (this.cursors.right.isDown ? 1 : 0) - (this.cursors.left.isDown ? 1 : 0),
      (this.cursors.down.isDown ? 1 : 0) - (this.cursors.up.isDown ? 1 : 0)
    );
    if (dir.length() > 0) dir.normalize();
    this.player.setVelocity(dir.x * speed, dir.y * speed);

    this.enemies.children.iterate((e) => {
      if (!e || !e.active) return;
      this.physics.moveToObject(e, this.player, 90);
    });
  }

  _spawn() {
    const e = this.enemies.get(
      Phaser.Math.Between(0, 800), Phaser.Math.Between(0, 600)
    );
    if (!e) return;
    e.setActive(true).setVisible(true);
    e.enableBody(true, e.x, e.y, true, true);
  }
}
