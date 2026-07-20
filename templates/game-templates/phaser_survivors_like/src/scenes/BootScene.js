import Phaser from 'phaser';

export class BootScene extends Phaser.Scene {
  constructor() { super('Boot'); }
  create() {
    const g = this.make.graphics({ x: 0, y: 0, add: false });
    g.fillStyle(0x4a8fe0); g.fillCircle(16, 16, 16); g.generateTexture('hero', 32, 32);
    g.clear();
    g.fillStyle(0xff5a5a); g.fillCircle(16, 16, 16); g.generateTexture('enemy', 32, 32);
    g.destroy();
    this.scene.start('Game');
  }
}
