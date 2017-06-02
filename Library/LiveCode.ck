Chmusick live => JCRev rev => Gain gate => dac;
TheCooker synth => dac;
/*SinOsc bass => gate;*/

live.file("kick",6) => Buffer.d1.read;
live.file("voces",1) => Buffer.d2.read;
live.file("hihat",2) => Buffer.d3.read;
live.file("snare",3) => Buffer.d4.read;

4 => live.CYCLES;
4 => live.MEASURE;
130 => live.TEMPO;
0.85 => gate.gain;
0.035 => rev.mix;
2 => synth.gain;
/*2 =>bass.gain;*/

spork~live.play(Buffer.d1,[1,0,1,0],0);
spork~live.play(Buffer.d3,[0,1],0);
/*spork~live.play(Buffer.d3,live.densify(live.every(4)),0);*/
/*spork~synth.sound(8,[62,64,65,74,69]);*/
/*spork~live.play(bass,[38,0,38,0]);*/

4 => int num;
spork~live.play(Buffer.d2);
while(true){
    live.Dur(live.TEMPO,live.MEASURE) => now;




    if(STATIC.BEATS % 8 == 0){
        //spork~live.play(Buffer.d4,[1],2);
    }
}
