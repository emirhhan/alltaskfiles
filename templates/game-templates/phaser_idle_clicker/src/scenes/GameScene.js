import Phaser from 'phaser';

export class GameScene extends Phaser.Scene {
  constructor() { super('Game'); }

  create() {
    this.money = 0;
    this.perClick = 1;
    this.perSec = 0;

    this.label = this.add.text(400, 200, 'Para: 0', {
      fontSize: '32px', color: '#ffffff'
    }).setOrigin(0.5);

    const btn = this.add.rectangle(400, 320, 200, 70, 0x2d6cdf)
      .setInteractive({ useHandCursor: true });
    this.add.text(400, 320, 'TIKLA', { fontSize: '24px', color: '#fff' }).setOrigin(0.5);

    btn.on('pointerdown', () => { this.money += this.perClick; this._update(); });
    this.time.addEvent({ delay: 1000, loop: true, callback: () => {
      this.money += this.perSec; this._update();
    }});
  }

  _update() {
    this.label.setText('Para: ' + this.money);
  }
}
