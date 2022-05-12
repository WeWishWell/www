<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>실험실</title>
	<script src="//cdn.jsdelivr.net/npm/phaser@3.55.2/dist/phaser.min.js"></script>
</head>
<body>

<div id="game" style="text-align: center; margin-top: 100px;"></div>
	
<script type="text/javascript">
	var sprites = [];
	var block;
	var player;
	var gameState;
	var highScore = 0;
	var keyR;
	var startTime;
	var second;
	var interval;
	
	class MainScene extends Phaser.Scene {
		constructor() {
			super();
			
			this.player;
			this.cursorKeys;
			
		}
		
		//에셋 로드
		preload() {
			player = this.make.graphics().fillStyle(0x00ff00).fillCircle(10,10,10,10);
			player.generateTexture("player", 20, 20);
			
			let ball = this.make.graphics().fillStyle(0xCC0000).fillCircle(5,5,5,5);
			ball.generateTexture("ball", 10, 10);
		}
		
		//게임 오브젝트 영역
		create() {
			player = this.physics.add.image(250,250,"player");
			player.setCircle(10);
			this.cursorKeys = this.input.keyboard.createCursorKeys();
			gameState = 0; // 0:준비, 1:시작, 2:게임오버
			//PLAYER 화면밖으로 나가지 못하게 설정
			player.setCollideWorldBounds(true);
			keyR = this.input.keyboard.addKey(Phaser.Input.Keyboard.KeyCodes.R);
			
			interval = setInterval(() => {
				if(gameState == 1) {
					var pos = Phaser.Geom.Rectangle.Random(this.physics.world.bounds);
			        block = this.physics.add.image(10, 10, 'ball');
			        block.setCircle(5);
			        block.setBounce(1).setCollideWorldBounds(true);
			        Phaser.Math.RandomXY(block.body.velocity, Math.ceil(Math.random()*100)+50);
			        sprites.push(block);
				}
			}, 1000);
			
			//버틴 시간 출력
			second = 0;
			this.textSecond = this.add.text(10, 10, "기록 : 0초", {font: "25px Arial", fill: "#FFFFFF"});
			this.time.addEvent({
				delay: 1000,
				callback: () => {
					if(gameState == 1) {
						second++;
					}
				},
				callbackScope: this,
				loop: true,
			});
			//게임 준비 텍스트
			this.textReady = this.add
				.text(250, 300, "스페이스바를 눌러 시작", {font: "25px Arial", fill: "#FFFFFF"})
				.setOrigin(0.5);
			//게임 오버 텍스트
			this.textGameOver = this.add
				.text(250, 200, "게임 오버 (R을 눌러 재시작)", {font: "25px Arial", fill: "#FFFFFF"})
				.setOrigin(0.5);
			this.textGameOver.visible = false;
			//최고 기록 텍스트
			this.textHighScore = this.add
				.text(250, 100, "최고기록 : 없음", {font: "25px Arial", fill: "#FFFFFF"})
				.setOrigin(0.5);
			
		}
		
		//로직 반복 수행 영역
		update() {
			//키를 누를때만 움직이도록 하기위함 (안누르면 0만큼 이동)
			player.setVelocity(0);
			this.textSecond.setText('기록 : '+second+'초');
			this.textHighScore.setText('최고기록 : '+highScore+'초');
			this.physics.add.overlap(player, block, ballHitsPlayer);
			if(gameState == 0) {
				this.textReady.visible = true;
				this.textGameOver.visible = false;
				if(this.cursorKeys.space.isDown) {
					gameState = 1;
					startTime = new Date();
					this.textReady.visible = false;
					this.textHighScore.visible = false;
				}
				return;
			} else if(gameState == 2) {
				this.textGameOver.visible = true;
				this.textHighScore.visible = true;
				if(keyR.isDown) {
					this.scene.restart();
				}
				return;
			}
			
			if(this.cursorKeys.up.isDown) {
				//up
				player.setVelocityY(-200);
			} else if(this.cursorKeys.down.isDown) {
				player.setVelocityY(200);
			}
			
			if(this.cursorKeys.left.isDown) {
				player.setVelocityX(-200);
			} else if(this.cursorKeys.right.isDown) {
				player.setVelocityX(200);
			}
		}
	}
	
	function ballHitsPlayer() {
		gameState = 2;
		clearInterval(interval);
		if(second > highScore) {
			highScore = second;
		}
	}
	
	const config = {
			type: Phaser.AUTO,
			width: 500,
			height: 500,
			parent: "game", //게임 영역 id
			backgroundColor: "#000000",
			physics: {
				default: "arcade",
				arcade: {
					debug: false,
				},
			},
			scene: MainScene,
	};
	
	let game = new Phaser.Game(config);
</script>
</body>
</html>