import Phaser from 'phaser';

export class BootScene extends Phaser.Scene {
  constructor() { super('Boot'); }
  create() {
    const g = this.make.graphics({ x: 0, y: 0, add: false });
    g.fillStyle(0x4a8fe0); g.fillRect(0, 0, 70, 70); g.generateTexture('tile', 70, 70);
    g.destroy();
    this.scene.start('Game');
  }
}
