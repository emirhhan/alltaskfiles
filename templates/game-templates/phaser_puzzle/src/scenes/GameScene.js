import Phaser from 'phaser';

export class GameScene extends Phaser.Scene {
  constructor() { super('Game'); }

  create() {
    this.selected = [];
    this.matches = 0;
    const colors = [0x4a8fe0, 0xff5a5a, 0x5aff8a, 0xffd24a];
    for (let r = 0; r < 4; r++) {
      for (let c = 0; c < 4; c++) {
        const id = Phaser.Math.Between(0, 3);
        const t = this.add.rectangle(150 + c * 80, 150 + r * 80, 70, 70, colors[id])
          .setInteractive();
        t.tileId = id;
        t.on('pointerdown', () => this._press(t));
      }
    }
  }

  _press(tile) {
    if (this.selected.includes(tile)) return;
    tile.setStrokeStyle(4, 0xffff00);
    this.selected.push(tile);
    if (this.selected.length >= 2) this._check();
  }

  _check() {
    const [a, b] = this.selected;
    if (a.tileId === b.tileId) {
      this.matches++;
      console.log('Eşleşme! Toplam:', this.matches);
      a.destroy(); b.destroy();
    } else {
      a.setStrokeStyle(); b.setStrokeStyle();
    }
    this.selected = [];
  }
}
