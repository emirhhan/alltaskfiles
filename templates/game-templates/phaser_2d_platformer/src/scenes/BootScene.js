import Phaser from 'phaser';

// Basit geometrik doku üret (asset dosyası gerektirmez)
export class BootScene extends Phaser.Scene {
  constructor() { super('Boot'); }

  create() {
    const g = this.make.graphics({ x: 0, y: 0, add: false });
    g.fillStyle(0x4a8fe0); g.fillRect(0, 0, 32, 48); g.generateTexture('hero', 32, 48);
    g.clear();
    g.fillStyle(0x2d6cdf); g.fillRect(0, 0, 32, 32); g.generateTexture('enemy', 32, 32);
    g.clear();
    g.fillStyle(0x6b6b6b); g.fillRect(0, 0, 64, 32); g.generateTexture('ground', 64, 32);
    g.destroy();
    this.scene.start('Game');
  }
}
