function init(son){
	var xhr = new XMLHttpRequest(); 
	xhr.open("POST", "test.php", true); 
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xhr.send("son="+son);
	
	xhr.onreadystatechange = function() { 
	   if(xhr.readyState == 4){
			var res = xhr.responseText;
			var res_split = res.split(',');
			var son = res_split[0];
			var time = res_split[1];
			charger_son(son,time);
		}
	} 
}

function charger_son(son, time){
	document.getElementById("titre").innerHTML = son;
	var sound = new Howl({
	   		src: ["son/"+son],
	   		onend:function(){
	   			sound.unload();
	      		init(son);
	     	},
	     	onload:function(){
	     		var duree = Math.round(sound.duration());
	     		var sec = duree%60;
	     		var min = Math.floor(duree / 60);
	     		document.getElementById("timer-total").innerHTML = "durée musique : "+min + " : " +sec;
	     	},
	     	onplay:function(){
	     		document.getElementById("timer-courant").innerHTML = "temps départ : "+sound.seek();
	     	}
	    });
	sound.play();
	sound.seek(time);
	
	document.getElementById("volup").onclick = function volumeup(){
		var vol = sound.volume();
		vol += 0.1;
		if (vol > 1) {
			vol = 1;
		}
		sound.volume(vol);
	}
	document.getElementById("voldown").onclick = function volumedown(){
		var vol = sound.volume();
		vol -= 0.1;
		if (vol < 0) {
			vol = 0;
		}
		sound.volume(vol);
	}


}
