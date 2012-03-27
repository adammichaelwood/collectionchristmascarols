﻿\version "2.14.2"
\include "../util.ly"
\paper {
  print-all-headers = ##t
  paper-height = 9\in
  paper-width = 6\in
  indent = 0\in
  %system-system-spacing = #'((basic-distance . 10) (padding . 0))
  %system-system-spacing =
  %  #'((basic-distance . 0)
  %     (minimum-distance . 0)
  %     (padding . -0.35)
  %     (stretchability . 100))
  ragged-last-bottom = ##f
  ragged-bottom = ##f
  two-sided = ##t
  inner-margin = 0.5\in
  outer-margin = 0.25\in
  first-page-number = #194
  print-first-page-number = ##t
  headerLine = \markup{\override #'(font-name . "Garamond Premier Pro") \smallCapsOldStyle"christmas"}
  oddHeaderMarkup = \markup\fill-line{
     \override #'(font-name . "Garamond Premier Pro")\abs-fontsize #8.5
     \combine 
        \fill-line{"" \on-the-fly #print-page-number-check-first
        \oldStylePageNum""
        }
        \fill-line{\headerLine}
  }
  evenHeaderMarkup = \markup {
     \override #'(font-name . "Garamond Premier Pro")\abs-fontsize #8.5
     \combine
        \on-the-fly #print-page-number-check-first
        \oldStylePageNum""
        \fill-line{\headerLine}
  }
}
#(set-global-staff-size 15) \paper{ #(define fonts (make-pango-font-tree "GoudyOlSt BT" "Garamond Premier Pro" "Garamond Premier Pro" (/ 15 20))) }
global = {
  \key f\major
  \time 4/4
  \autoBeamOff
}

sopMusic = \relative c'' {
  \partial 4 g4 |
  g f g8 a bes4 |
  bes8 a4 g8 f4 f |
  
  f g a4. g8 |
  f4 g8 a4 g8 f4 |
  \partial 2. g2. \bar "||" \break
}

verseMusic = \relative c'' {
  
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  d4 |
  d d d8 f f4 |
  f8 f4 d8 d4 d |
  
  d d f4. d8 |
  d4 bes8 f'4 c8 d4 |
  d2.
  
  \slurDotted \oneVoice
  g8 d' d c bes( a) g4 |
  a8 bes a g f4 d |
  
  g8 bes a bes c( a) f4 |
  bes8 g f a g4 g \bar "|."
}
altoWords = \lyricmode {
  Gau -- de -- te, gau -- de -- te,
  Chris -- tus est na -- tus
  ex Ma -- ri -- a Vir -- gi -- ne, Gau -- de -- te!
  
  \set stanza = #"1. "
  \set ignoreMelismata = ##t
  Tem -- pus ad -- est gra -- ti -- æ
  hoc quod op -- ta -- ba -- mus,
  car -- mi -- na le -- ti -- ti -- æ
  de -- vo -- tæ re -- da -- mus.
}
altoWordsII = \lyricmode {
%\markup\italic
  \repeat unfold 21 {\skip1}
  \set stanza = #"2. "
  \set ignoreMelismata = ##t
  De -- us ho -- mo fac -- tus est
  na -- tu -- ra mi -- ran -- te,
  mun -- dus re -- no -- va -- tus est
  a Chris -- to re -- gnan -- te.
}
altoWordsIII = \lyricmode {
  \repeat unfold 21 {\skip1}
  \set stanza = #"3. "
  E -- ze -- chie -- lis por -- ta
  cla -- sa per tran -- si -- tur,
  un -- de lux est or -- ta,
  sa -- lus in -- ve -- ni -- tur.
}
altoWordsIV = \lyricmode {
  \repeat unfold 21 {\skip1}
  \set stanza = #"4. "
  \set ignoreMelismata = ##t
  Er -- go nos -- tra can -- ti -- o
  psal -- lam jam in lu -- stro,
  be -- ne -- di -- cat Do -- mi -- no,
  Sa -- lus Re -- gi nos -- tro.
}
altoWordsV = \lyricmode {
  \set stanza = #"5. "
  \set ignoreMelismata = ##t
}
altoWordsVI = \lyricmode {
  \set stanza = #"6. "
  \set ignoreMelismata = ##t
}
tenorMusic = \relative c' {
  g4 |
  bes a bes8 c d4 |
  d8 c4 bes8 a4 a |
  
  a bes c4. bes8 |
  a4 g8 f4 g8 a4 |
  g2.
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  g'4 |
  g d g8 f bes,4 |
  bes8 f'4 g8 d4 d |
  
  d g f4. g8 |
  d4 e8 f4 e8 d4 |
  g,2.
}
bassWords = \lyricmode {

}

pianoRH = \relative c' {
  
}
pianoLH = \relative c' {
  
}

\score {
  <<
   \new ChoirStaff <<
%    \new Lyrics = sopranos \with { \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) }
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "sopranos" \sopWords
     \new Lyrics = "altosVI"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "altos" \altoWordsVI
    \new Lyrics = "altosV"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "altos" \altoWordsV
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "altos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "altos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "altos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "altos" \altoWords
   \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"men" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) } \lyricsto "basses" \bassWords
  >>
%    \new PianoStaff << \new Staff { \new Voice { \pianoRH } } \new Staff { \clef "bass" \pianoLH } >>
  >>
  \layout {
    \context {
      \Score
      %\override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 8)
      %\override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 4)
    }
    \context {
      % Remove all empty staves
      % \Staff \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t
    }
  }
  \header {
    title = \markup{\override #'(font-name . "Garamond Premier Pro Semibold"){ \abs-fontsize #15 \smallCapsOldStyle"Gaudete"}}
    composer = \markup\oldStyleNum"15th Century"
    tagline = \markup\concat{"Chorus and text of verses from " \italic"Piæ Cantiones" \oldStyleNum", 1582, via " \italic"imslp.org" ", Melody of verses from " \italic "www.cpdl.org"}
  }
}
\markup \vspace #0.5
\markup \fill-line {\center-column{
    \concat{"Chorus and text of verses from " \italic"Piæ Cantiones" \oldStyleNum", 1582, via " \italic"imslp.org" ", Melody of verses from " \italic "www.cpdl.org"}}}
\markup\vspace#1.6























global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \override DynamicLineSpanner #'staff-padding = #0.0
  \override DynamicLineSpanner #'Y-extent = #'(-1 . 1)
}

sopMusic = \relative c' {
  \repeat volta 2 {
    \partial 2 fis4. g8 |
    a4 d cis b8[ a] |
    d2 d4 cis8[ d] |
    
    e4 d8[cis] b4 cis8[ b] |
    a2 a4 c |
    b a8[ g] fis4 e |
    d2 fis4. fis8 |
    
    g4 gis a a |
    a2 b4. b8 |
    cis4 d d8[ cis] b[ cis] |
    \partial 2 d2 |
  }
  \pageBreak
  \repeat volta 3 {
    \partial 2 a4. a8 |
    fis'4 d b e |
    d4 cis8[ b] a4. a8 |
    a4. a8 d4 d |
    
    d cis e4. d8 |
    cis4 b a a |
    a a fis4. fis8 |
    
    g4 gis a a |
    a2 b4. b8 |
    cis4 d d8[ cis] b[ cis] |
    \partial 2 d2 | \break
  }
  \partial 2 a4. a8 |
  fis'4 d b e |
  d4 cis8[ b] a4. a8 |
  a4 a d d |
  
  d cis e4. d8 |
  cis4 b a a |
  a^\markup{\italic"rall." \dynamic"ff"} a a4. a8 |
  
  d4 a fis g |
  b-> a a4.^\pp a8 |
  a4 a a^\markup\italic"rall." a 
  a2 a \bar "|."
}
sopWords = \lyricmode {
  
}

altoMusic = \relative c' {
  d4. d8 |
  d4 fis e d8[ cis] |
  d2 fis4 fis |
  
  e fis fis e8[ d] |
  cis2 d4 e |
  d d d d8[ cis] |
  d2 d4. d8 |
  
  d4 d cis d8[ e] |
  d2 d4. d8 |
  e4 d g g |
  fis2 |
  
  
  fis4. fis8 |
  a4 a a g |
  g4. g8 g4. g8 |
  fis4. fis8 fis4 gis |
  
  a a g4. g8 |
  g4 g e fis |
  g fis d4. d8 |
  
  d4 d cis d8[ e] |
  d2 d4. d8 |
  e4 d g g |
  fis2 |
  
  
  fis4. fis8 |
  a4 a a g |
  g4. g8 g4. g8 |
  fis4 fis fis gis |
  
  a4 a g4. g8 |
  g4 g e fis |
  g fis a4. a8 |
  
  d,4 a' fis g |
  b a e4. fis8 |
  g4 fis e d |
  e2 fis \bar "|."
}
altoWords = \lyricmode {
  \set stanza = #"1. "
  Glo -- rious, beau -- teous, gol -- den -- bright,
  Shed -- ding soft -- est pu -- rest light,
  Shone the stars that \set associatedVoice = "tenors" Christ -- mas night,
  When the Jew -- ish shep -- herds kept
  Watch be -- side \unset associatedVoice their flocks that slept.
  
  \set stanza = #"3. "
  Soft and pure and ho -- ly glo -- ry,
  Kings and seers and pro -- phets hoa -- ry,
  Shed through -- out the sa -- cred sto -- ry:
  While the priests, like shep -- herds true,
  Watch’d be -- side God’s cho -- sen __ few.
  
  \set stanza = #"6. "
  Since that Light then dar -- kens nev -- er,
  Let us all, with glad en -- dea -- vor,
  Sing the song that e -- choes ev -- er:
  Glo -- ry in the high -- est Hea -- ven!
  Peace on earth to us for giv -- en.
}
altoWordsII = \lyricmode {
%\markup\italic
  \set stanza = #"2. "
  But the stars’ sweet gold -- en gleam
  Fad -- ed quick -- ly as a dream
  ’Mid the won -- drous \set associatedVoice = "tenors" glo -- ry -- stream,
  That il -- lum -- ined all the earth,
  When Christ’s An -- \unset associatedVoice gels sang His birth.
  
  \set stanza = #"4. "
  But that light no more a -- vail -- ed,
  All its splen -- dor straight -- way pal -- ed
  In His light whom An -- gels hail -- ed;
  E -- ven as the stars of old,
  ’Mid the bright  -- ness lost their gold.
}
altoWordsIII = \lyricmode {
  \repeat unfold 35 { \skip 1 }
  \set stanza = #"5. "
  Now no more on Christ -- mas night, __ _
  Is the sky with An -- gels bright, __ _
  But for ev -- er shines the Light; __ _
  E -- ven He whose birth they told
  To the shep -- herds by __ the __ fold.
}
altoWordsIV = \lyricmode {
}
altoWordsV = \lyricmode {
}
altoWordsVI = \lyricmode {
}
tenorMusic = \relative c' {
  a4. a8 |
  a4 a a a |
  a2 b4 a |
  
  a4 a a gis |
  a2 fis4 g! |
  g4 g a8[ fis] a[ g] |
  fis2 fis4. fis8 |
  
  d4 e e fis8[ g] |
  fis2 g4. b8 |
  a4 a e' d8[ e] |
  d2 |
  
  
  d4. d8 |
  d4 d d e |
  e4. d8 e4. e8 |
  d4. d8 d4 d |
  
  e e cis4. d8 |
  e4 d cis d |
  cis d a4. d,8 |
  
  d4 e e fis8[ g] |
  fis2 g4. b8 |
  a4 a e' d8[ e] |
  d2 |
  
  
  d4. d8 |
  d4 d d e |
  e4. d8 e4. e8 |
  d4 d d d |
  
  e e cis4. d8 |
  e4 d cis d |
  cis <<d {s8 s_\ff}>> a4. a8 |
  
  d4 a fis g |
  b a cis_\pp d |
  cis d cis b |
  cis2 d \bar "|."
}
tenorWords = \lyricmode {

}

bassMusic = \relative c {
  d4. e8 |
  fis4 d g g |
  fis2 b,4 fis' |
  
  cis4 fis d e |
  a,2 d4 c |
  g' b, a a |
  d2 b4. b8 |
  
  b4 b a a |
  d2 g4. g8 |
  g4 fis a a, |
  d2 |
  
  
  d4. d8 |
  d4 fis g e |
  a4. b8 cis4. cis8 |
  d4. d8 b4 b |
  
  a a a4. a8 |
  a4 a a d, |
  a' d, d4. b8 |
  
  b4 b a a |
  d2 g4. g8 |
  g4 fis a a, |
  d2 |
  
  
  d4. d8 |
  d4 fis g e |
  a4. b8 cis4. cis8 |
  d4 d b b |
  
  a a a4. a8 |
  a4 a a d, |
  a' d, a4. a8 |
  
  d4 a fis g |
  b a a a |
  a a a a |
  a2 d \bar "|."
}
bassWords = \lyricmode {

}

pianoRH = \relative c' {
  
}
pianoLH = \relative c' {
  
}

\score {
  <<
   \new ChoirStaff <<
%    \new Lyrics = sopranos \with { \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) }
    \new Staff = women <<
      \new Voice = "sopranos" { \voiceOne << \global \sopMusic >> }
      \new Voice = "altos" { \voiceTwo << \global \altoMusic >> }
    >>
    \new Staff = men <<
      \clef bass
      \new Voice = "tenors" { \voiceOne << \global \tenorMusic >> }
      \new Voice = "basses" { \voiceTwo << \global \bassMusic >> }
    >>
    \new Lyrics \with { alignAboveContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "sopranos" \sopWords
     \new Lyrics = "altosVI"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "sopranos" \altoWordsVI
    \new Lyrics = "altosV"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "sopranos" \altoWordsV
    \new Lyrics = "altosIV"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "sopranos" \altoWordsIV
    \new Lyrics = "altosIII"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "sopranos" \altoWordsIII
    \new Lyrics = "altosII"  \with { alignBelowContext = #"women" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1))} \lyricsto "sopranos" \altoWordsII
    \new Lyrics = "altos"  \with { alignBelowContext = #"women" } \lyricsto "sopranos" \altoWords
     \new Lyrics \with { alignAboveContext = #"men" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) } \lyricsto "tenors" \tenorWords
    \new Lyrics \with { alignBelowContext = #"men" \override VerticalAxisGroup #'nonstaff-relatedstaff-spacing = #'((basic-distance . 1)) } \lyricsto "basses" \bassWords
  >>
%    \new PianoStaff << \new Staff { \new Voice { \pianoRH } } \new Staff { \clef "bass" \pianoLH } >>
  >>
  \layout {
    \context {
      \Score
      %\override SpacingSpanner #'base-shortest-duration = #(ly:make-moment 1 8)
      %\override SpacingSpanner #'common-shortest-duration = #(ly:make-moment 1 4)
    }
    \context {
      % Remove all empty staves
      % \Staff \RemoveEmptyStaves \override VerticalAxisGroup #'remove-first = ##t
    }
  }
  \header {
    title = \markup{\override #'(font-name . "Garamond Premier Pro Semibold"){ \abs-fontsize #15 \smallCapsOldStyle"Glorious, Beauteous, Golden-Bright"}}
    poet = \markup\oldStyleNum"Anna M. E. Nichols"
    composer = \markup\oldStyleNum"Maria Tiddeman (1837-1915)"
    tagline = \markup { "from" \italic {Christmas Carols, New and Old}}
  }
}
\header {
  tagline = \markup { "from" \italic {Christmas Carols, New and Old}}
}
