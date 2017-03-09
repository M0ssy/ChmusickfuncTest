Chmusick live => JCRev rev => Gain gate => dac;
Notes notes;

SinOsc bass;
SawOsc melody;
TheCooker synth => rev;
Rhodey wurley => rev;

live.file("kick",5) => Buffer.d1.read;
live.file("hihat",1) => Buffer.d2.read;
live.file("arpy") => Buffer.d3.read;
live.file("dorkbot") => Buffer.d4.read;
live.file("erk") => Buffer.d5.read;
live.file("elec",8) => Buffer.d6.read;
live.file("claps",5) => Buffer.d7.read;

4 => live.CYCLES;
4 => live.MEASURE;
130 => Chmusick.tempo;
0.5 => gate.gain;
0.03 => rev.mix;
0.18 => melody.gain;
0.3 => wurley.gain;

live.subArray(live.transpose(notes.modes(1),48),[1,-1,-1,-1,-1,6,-1,-1,-1,-1]) @=> int tri[];
(live.every(4),1) => live.density @=> int bdR[];
(live.every(4),1) => live.rotate => live.densify @=> int hhR[];
(live.every(4),0.3) => live.densify => live.rotate @=> int arpyR[];
([34,0,0,0,41,0,0,0],1) => live.rotate @=> int bassR[];
[1,0] @=> int battlesR[];
[60,0,60,0,67,72] => live.randomize @=> int synthR[];

//spork~live.play(Buffer.d8,["casio","~"],0);
spork~live.play(melody,tri,1);
spork~live.play(Buffer.d1,bdR,1);
spork~live.play(Buffer.d2,hhR);
//spork~live.play(Buffer.d3,arpyR,3);
spork~live.play(bass,bassR,1);
//spork~live.play(Buffer.d4,battlesR,0);
spork~synth.sound(16,synthR); //change function name
//spork~live.play(Buffer.d5,[1,0,0,0,1,0,1,0]);
//spork~live.play(wurley,[0,0,0,0,48,0,0,0],2);
//spork~live.play(Buffer.d6,[0,1,0,0,1,0],3);
//spork~live.play(Buffer.d7,[0,0,1,0],0);

//add harmony

while(true){
    for(0 => int i; i < 8; i++){
        live.Dur(live.TEMPO,live.MEASURE) => now;
        //live.file("arpy",i+1) => Buffer.d3.read;
        if(STATIC.BEATS % 8 == 0){
            for(0 => int i; i < synthR.size(); i++){
                if(synthR[i] != 0){
                  synthR[i] + 7 => synthR[i];
                }
            }
        }
    }
}
