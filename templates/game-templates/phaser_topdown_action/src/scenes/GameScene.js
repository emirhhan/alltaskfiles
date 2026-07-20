import Phaser from 'phaser';

export class GameScene extends Phaser.Scene {
  constructor() { super('Game'); }

  create() {
    this.player = this.physics.add.sprite(200, 300, 'hero');
    this.player.health = 100;
    this.player.invincible = false;
    this.player.setCollideWorldBounds(true);

    this.enemies = this.physics.add.group();
    for (let i = 0; i < 3; i++) {
      const e = this.enemies.create(500 + i * 60, 300, 'enemy');
      e.state = 'PATROL';
    }

    this.cursors = this.input.keyboard.createCursorKeys();
    this.physics.add.overlap(this.player, this.enemies, this._hit, null, this);
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
      if (!e) return;
      const dist = Phaser.Math.Distance.Between(e.x, e.y, this.player.x, this.player.y);
      if (dist < 200) {
        this.physics.moveToObject(e, this.player, 120);
      } else {
        e.setVelocity(0, 0);
      }
    });
  }

  _hit(player, enemy) {
    if (player.invincible) return;
    player.health -= 10;
    player.invincible = true;
    player.setAlpha(0.4);
    this.time.delayedCall(500, () => { player.invincible = false; player.setAlpha(1); });
    if (player.health <= 0) {
      player.disableBody(true, true);
      console.log('Oyun bitti');
    }
  }
}
