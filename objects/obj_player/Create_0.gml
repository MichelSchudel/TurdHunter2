//All game settings like difficulty are defined here.

//How fast should the stamina bar deplete or recharge? Firesper x frames.
STAMINA_TIMER_VALUE = 20;
//walking speed when stamina is not depleted
FAST_SPEED = 2;
//walking speed when stamina is depleted.
SLOW_SPEED = 1;
//stamina at full health
MAX_PLAYER_STAMINA = 100;

//player health full 
MAX_PLAYER_HEALTH = 100;

//determines the range of the nuke
NUKE_EXPLOSION_RADIUS = 100;

//determines when the nuke is available above what stamina level
NUKE_EXPLOSION_STAMINA_THESHOLD = 90




//initialize initial values
player_stamina = MAX_PLAYER_STAMINA;
health_timer = STAMINA_TIMER_VALUE;
player_health = MAX_PLAYER_HEALTH;

global.score = 0;
global.level = 0;

bullet_spawn_timer = 60;

alarm[0] = bullet_spawn_timer;
