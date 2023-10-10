go :- cek(Binatang),
       write('Saya kira hewan tersebut adalah: '),
       write(Binatang), nl, undo.

/* Hipotesis yang akan diuji */
cek(anjing) :- anjing,!.
cek(serigala) :- serigala,!.
cek(elang) :- elang,!.
cek(cheetah) :- cheetah, !.
cek(tiger) :- tiger, !.
cek(kambing) :- kambing, !.
cek(panda) :- panda, !.
cek(beruang) :- beruang, !.
cek(ostrich) :- ostrich, !.
cek(penguin) :- penguin, !.
cek(unknown). /* tidak ada dapat diperiksa*/

/* Aturan identifikasi hewan */
cheetah :- mammal, carnivore,
                verify(memiliki_warna_belang-belang_cokelat),
                verify(memiliki_bercak_hitam).
tiger :- mammal, carnivore,
            verify(memiliki_warna_belang-belang_cokelat),
            verify(memiliki_garis_hitam).
ostrich :- bird,
               verify(tidak_bisa_terbang),
               verify(memiliki_leher_panjang).
penguin :- bird,
                 verify(tidak_bisa_terbang),
                 verify(berenang),
                 verify(hitam_dan_putih).
elang :-  bird, carnivore,
                   verify(mata_tajam),
                   verify(terbang_dengan_baik).
serigala :- carnivore,canis,
        verify(biasa_tinggal_digunung),
        verify(liar).
anjing :- canis,
        verify(lucu),
        verify(dapat_dipelihara).
panda :- mammal, herbivore,
        verify(memakan_tebu),
        verify(bercorak_hitam_putih).
kambing  :- mammal, herbivore,
        verify(memakan_rumput).
beruang :- mammal, carnivore,
        verify(bercorak_satu_warna).

/* Aturan klasifikasi */
mammal :- verify(memiliki_bulu), !.
mammal :- verify(menghasilkan_susu).
bird :- verify(memiliki_bulu), !.
bird :- verify(terbang),
           verify(menaruh_telur).
carnivore :- verify(memakan_daging), !.
carnivore :- verify(memiliki_gigi_runcing),
                    verify(memiliki_cakar),
                    verify(memiliki_mata_maju).
herbivore :- verify(memakan_tumbuhan),!.
canis :- verify(dapat_dipelihara),!.
canis :- verify(pemakan_daging),
    verify(hidup_berkelompok).
/* Cara bertanya pertanyaan */
ask(Pertanyaan) :-
        write('Apakah hewan ini memiliki atribut berikut: '),
        write(Pertanyaan), write('? '),
         read(Jawaban), nl,
         ( (Jawaban == ya ; Jawaban == y)
         -> assert(ya(Pertanyaan)) ;
         assert(tidak(Pertanyaan)), fail).
:- dynamic ya/1,tidak/1.
/* Cara memverifikasi sesuatu */
verify(S) :- (ya(S) -> true ; (tidak(S) -> fail ; ask(S))).
/* Membatalkan semua pernyataan ya/tidak */
undo :- retract(ya(_)),fail.
undo :- retract(tidak(_)),fail.
undo.

