<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xpath-default-namespace="http://www.tei-c.org/ns/1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:eg="http://www.tei-c.org/ns/Examples"
  xmlns:xd="http://www.pnp-software.com/XSLTdoc" xmlns:fn="http://www.w3.org/2005/xpath-functions"
  xmlns:tei="http://www.tei-c.org/ns/1.0" xmlns="http://www.w3.org/1999/xhtml"
  exclude-result-prefixes="#all">

  <xd:doc type="stylesheet">
    <xd:short> EN: This file collects parameters and configurable variables used in the other
      modules. IT: Questo file è una collezione di parametri e variabili configurabili, usati negli
      altri moduli. </xd:short>
  </xd:doc>

  <!-- GLOBAL -->
  <!-- EN: The global variable $root is in the file evt_builder-main.xsl-->
  <!-- IT: La variabile globale $root si trova nel file evt_builder-main.xsl-->
  <!-- Parameters -->
  <!-- EN: It is possible to modify these prefixes so that they point to a custom web site, for instance:
            <xsl:param name="filePrefix" select="'http://your.website.org/'"/>
          -->
  <!-- IT: E' possibile modificare i prefissi per puntare ad un server personalizzato, ad esempio:
            <xsl:param name="filePrefix" select="'http://tuosito.it/b'"/>
          -->
  <xsl:param name="mainPrefix" select="'.'"/>
  <xsl:param name="filePrefix" select="'../../..'"/>
  <xsl:param name="dataPrefix" select="'../..'"/>
  <xsl:param name="imageExt">jpg</xsl:param>

  <!-- EN: Main web site for digital edition -->
  <!-- IT: Sito web principale dell'edizione digitale -->
  <!-- default: '' -->
  <xsl:param name="webSite" select="'https://github.com/pax3l/m2_ovid_deities_analysis_for_quarto'"/>

  <!-- EN: Edition title -->
  <!-- IT: Titolo edizione -->
  <!-- default: 'Codex Viewer' -->
  <xsl:param name="index_title" select="'Les Métamorphoses d’Ovide — Apollon, Jupiter, Minerve'"/>

  <!-- EN: Welcome Message -->
  <!-- IT: Messaggio di benvenuto -->
  <!-- default: 'Welcome to an edition created with EVT' -->
  <xsl:param name="welcomeMsg">
    <div>
      <p class="title main">Bienvenue dans cette édition numérique des Métamorphoses créée avec EVT
        1</p>
    </div>
    <div>Cette édition fait partie de mon mémoire de recherche de 2e année de Master Humanités
      classiques et huamnités numériques à l'Université Paris 10 Nanterre, sous la direction de
      monsieur Aurélien Berra.</div>
    <div>Pour plus d'informations sur l'utilisation de la présente édition, référez-vous au manuel
      dans le dossier "doc". Pour plus d'infirmations concernant le mémoire, vous pouvez consulter
      le dépôt en ligne <a href="https://github.com/pax3l/m2_ovid_deities_analysis_for_quarto"
        >ici</a>. Si vous avez des questions, des suggestions ou que vous repérez un bug, n'hésitez
      pas à laisser une issue sur <a href="">ce dépôt</a>.</div>
    <div>Bonne lecture !</div>
    <div>Axelle Penture</div>
  </xsl:param>

  <!-- EN: Hide/Show scans -->
  <!-- IT: Nascondi/Mostra scansioni -->
  <!-- default: true() -->
  <xsl:param name="image_frame" select="false()"/>
  <!-- EN: Hide/Show badge -->
  <!-- IT: Nascondi/Mostra badge -->
  <!-- default: true() -->
  <xsl:param name="badge" select="true()"/>
  <!-- EN: Set text in badge -->
  <!-- IT: Imposta testo del badge -->
  <!-- ex: alpha, beta, stable etc -->
  <xsl:param name="badge_text" select="'DIGITAL'"/>
  <!-- EN: On/Off double page view -->
  <!-- IT: Attiva/Disattiva vista doppia pagina -->
  <!-- default: true() -->
  <xsl:param name="double_view" select="false()"/>

  <!-- ################ -->
  <!-- PREFATORY MATTER -->
  <!-- ################ -->

  <!-- EN: On/Off regesto -->
  <!-- IT: Attiva/Disattiva regesto -->
  <!-- default: false() -->
  <xsl:param name="regesto" select="false()"/>
  <!-- EN: On/Off <front> Information -->
  <!-- IT: Attiva/Disattiva Informazioni del <front> -->
  <!-- default: true() -->
  <xsl:param name="frontInfo" select="false()"/>
  <!-- EN: On/Off Manuscript Description -->
  <!-- IT: Attiva/Disattiva Descrizione del manoscritto-->
  <!-- default: true() -->
  <xsl:param name="msDesc" select="false()"/>
  <!-- EN: On/Off Header general information -->
  <!-- IT: Attiva/Disattiva Informazioni generali -->
  <!-- default: true() -->
  <xsl:param name="headerInfo" select="true()"/>
  <!-- EN: On/Off Bibliography -->
  <!-- IT: Attiva/Disattiva Bibliografia -->
  <!-- default: true() -->
  <xsl:param name="bibliography" select="false()"/>

  <!-- ############## -->
  <!-- EDITION LEVELS -->
  <!-- ############## -->

  <!-- EN: To use it in your code:
                    <xsl:value-of select="$edition_array[n]" />	-->
  <!-- IT: Per l'utilizzo nel codice:
                    <xsl:value-of select="$edition_array[n]" />	-->

  <!-- EN: It is possible to skip production of pages for a specific edition simply
                    removing the textual part of the corresponding item. -->
  <!-- IT: E' possibile rimuovere la produzione di pagine di una determinata edizione
                    semplicemente rimuovendo la parte testuale dell'item corrispondente. -->
  <xsl:variable name="edition_array" as="element()*">
    <edition>Diplomatic</edition>
    <!--    <edition>Interpretative</edition>-->
    <edition></edition>
    <!-- EN: To add a new edition it is necessary to add a new line here and -forcedly- a
                declaration concerning output file in the modules/evt_builder-main.xsl file,
                under the <xsl:if test="$edition_array[2]!=''" condition>
                For instance: <edition>New_edition</edition> -->
    <!-- IT: Per aggiungere una nuova edizione, bisognerà inserire una nuova riga qui e -necessariamente-
                la dichiarazione per i file di output nel file modules/evt_builder-main.xsl,
                sotto la condizione <xsl:if test="$edition_array[2]!=''">
                Esempio: <edition>Nuova_edizione</edition> Add by FS -->
  </xsl:variable>
  <!-- EN: It is possibile to customize the prefix used in the creation of the classes of the html elements of the edition -->
  <!-- IT: E' possibile personalizzare il prefisso usato nella creazione delle classi degli elementi html dell'edizione. -->
  <xsl:variable name="ed_name1">dipl</xsl:variable>
  <xsl:variable name="ed_name2">interp</xsl:variable>
  <!-- EN: Enable/Disable translation -->
  <!-- IT: Attiva/Disattiva traduzione -->
  <xsl:variable name="translation" select="false()"/>
  <!-- Thumbnail image -->
  <xsl:variable name="fb_thumb" select="''"/>
  <!-- EN: Indicate the xml node that contains all the text to be transformed for each edition level -->
  <!-- IT: Indicare il nodo xml che contiene il testo da trasformare per ogni livello di edizione -->
  <!--<xsl:variable name="ed_content" select="if(//tei:text/tei:group[@xml:id='group'])
           then(//tei:text/tei:group[@xml:id='group']/name()) else ( //tei:body/name() )"/>-->
  <xsl:variable name="ed_content" select="
      if (//tei:text/tei:group) then
        (//tei:text/tei:group/name())
      else
        (//tei:text/name())"/>
  <!-- EN: Starting point for the split of elements containing <pb/> and <lb/> elements -->
  <!-- IT: Punto di partenza per la divisione degli elementi contententi elementi <pb/> e <lb/> -->
  <!--<xsl:variable name="start_split" select="if(//tei:text/tei:group[@xml:id='group'])
          then(//tei:text/tei:group[@xml:id='group']/name()) else( if(//tei:body/tei:div[@subtype='edition_text'])
          then(//tei:body/tei:div[@subtype='edition_text']/name()) else(//tei:body/name()) )"/>-->
  <!-- Retrocompatiblità gestita solo per documenti unitari -->
  <xsl:variable name="start_split" select="
      if (//tei:text/tei:group) then
        (//tei:text/tei:group/name())
      else
        (if (count(//tei:body/tei:div[@subtype = 'edition_text']) > 1) then
          (//tei:body/tei:div[@subtype = 'edition_text']/name())
        else
          (//tei:text/tei:body/name()))"/>

  <!--  <xsl:variable name="start_split_depth"
    select="//node()[name() = $start_split]/count(ancestor-or-self::node())"/>
  <xsl:variable name="max_depth" as="xs:integer"
    select="max(((max(//tei:pb/count(ancestor-or-self::node())) - //node()[name() = $start_split]/count(ancestor-or-self::node())), (max(//tei:lb/count(ancestor-or-self::node())) - //node()[name() = $start_split]/count(ancestor-or-self::node())), (max(//tei:cb/count(ancestor-or-self::node())) - //node()[name() = $start_split]/count(ancestor-or-self::node()))))"/>-->

  <xsl:param name="defaulTextLabel" select="false()"/>

  <!-- ################# -->
  <!-- INTERFACE CONTROL -->
  <!-- ################# -->

  <!-- DEFAULT CONTENT SEEN -->
  <!-- EN: Set default content on first load for left frame choosing between image or manuscript info
            Possible values are:
            - 'image' if you want to see the image on first load
            - 'info'  if you want to see the manuscript info on first load
            Any other value will work as 'image'.
        -->
  <!-- IT: Indicare cosa visualizzare di default al primo caricamento nel frame sinistro: immagine o informazioni sul manoscritto
            I valori possibili sono:
            - 'image' se si vuole visualizzare l'immagine al primo caricamento
            - 'info'  se si vogliono visualizzare le informazioni sul manoscritto al primo caricamento
            Qualsiasi altro valore varrà come 'image'
        -->
  <xsl:variable name="left_frame_default_content" select="'image'"/>
  <!-- EN: Set default content on first load for right frame choosing between text or text front info
        Possible values are:
        - 'text' if you want to see the text on first load
        - 'info'  if you want to see the text front info on first load
        Any other value will work as 'text'.
        -->
  <!-- IT: Indicare cosa visualizzare di default al primo caricamento nel frame destro: testo o informazioni sul testo
          I valori possibili sono:
          - 'text' se si vuole visualizzare il testo al primo caricamento
          - 'info'  se si vogliono visualizzare le informazioni sul testo al primo caricamento
          Qualsiasi altro valore varrà come 'text'
        -->
  <xsl:variable name="right_frame_default_content" select="'text'"/>

  <!-- BUTTONS PRESENCE AND POSITION -->

  <!-- EN: Show/Hide Txt/Img Link Button in interface -->
  <!-- IT: Mostra/Nascondi pulsante Txt/Img Link nell'interfaccia web -->
  <!-- default: true() -->
  <xsl:param name="txtimg_link_button" select="false()"/>
  <!-- EN: Show/Hide Hotspot Button in interface -->
  <!-- IT: Mostra/Nascondi pulsante Hotspot nell'interfaccia web -->
  <!-- default: true() -->
  <xsl:param name="hs_button" select="false()"/>
  <!-- EN: Show/Hide Magnifier Button in interface -->
  <!-- IT: Mostra/Nascondi pulsante Lente di ingrandimento nell'interfaccia web -->
  <!-- default: true() -->
  <xsl:param name="mag_button" select="false()"/>
  <!-- EN: Show/Hide Thumbnails Button in interface -->
  <!-- IT: Mostra/Nascondi pulsante Thumbnails nell'interfaccia web -->
  <!-- default: true() -->
  <xsl:param name="thumbs_button" select="false()"/>
  <!-- EN: Show/Hide Viscoll Button in interface -->
  <!-- IT: Mostra/Nascondi pulsante Viscoll nell'interfaccia web -->
  <!-- default: false() -->
  <xsl:param name="viscoll_button" select="false()"/>
  <!-- VISCOLL -->
  <!-- In order to let Viscoll work properly, you need to prepare
              the collation scheme and the image list, as it is explained in the points
              1 and 2 of Viscoll documentation (https://github.com/leoba/VisColl). First create your collation model,
              then prepare the image list as indicated (or just have an encoded xml TEI file containing a facsimile section)
              and process it at http://138.197.87.173:8080/xproc-z/visualize-collation/ -->

  <!-- EN: Path to xml file containing viscoll scheme.
              If you need to use an online resource, put the complete URL (e.g: http://www.mysite.com/viscollScheme.xml) here.
              Otherwise put the file in data/input_data/text folder and just put the relative path starting from that folder here. -->
  <!-- IT: Percorso al file xml contenente lo schema viscoll.
              Se si usa una risorsa online, inserire il percorso completo (ex. http://www.ilmiosito.it/schemaViscoll.xml).
              Altrimenti copiare il file nella cartella data/input_data/text e
              inserire qui solo percorso relativo a partire da quella cartella. -->
  <xsl:param name="viscoll_scheme_path" select="''"/>
  <!-- EN: Path to xml file containing viscoll images list.
                If you need to use an online resource, put the entire path (e.g: http://www.mysite.com/viscollImagelist.xml) here.
                Otherwise put the file in data/input_data/text folder and just put the relative path starting from that folder here. -->
  <!-- IT: Percorso al file xml contenente la lista delle immagini necessaria al corretto funzionamento di viscoll.
                Se si usa una risorsa online, inserire il percorso completo (ex. http://www.ilmiosito.it/viscollImagelist.xml).
                Altrimenti copiare il file nella cartella data/input_data/text
                e inserire qui solo percorso relativo a partire da quella cartella. -->
  <xsl:param name="viscoll_image_list_path" select="''"/>

  <!-- EN: Show/Hide Edition level selector in interface -->
  <!-- IT: Mostra/Nascondi selettore Livello/i Edizione nell'interfaccia web -->
  <!-- default: true() -->
  <xsl:param name="edition_level_selector" select="false()"/>
  <!-- IT: Choose page selector position -->
  <!-- IT: Scegli posizione Selettore pagina -->
  <!-- "left" or "right" | Default: "right" -->
  <xsl:param name="pp_selector_pos" select="'right'"/>
  <!-- EN: Choose whether or not to group pages by document in the selector -->
  <!-- IT: Scegli se raggruppare o meno le pagine per documento nel selettore apposito -->
  <!-- default: true() -->
  <xsl:param name="pp_selector_doc_grouping" select="true()"/>
  <!-- EN: Choose whether or not having a tooltip on pages option showing the belonging document  -->
  <!-- IT: Scegli se avere un tooltip sulle opzioni delle pagine che mostra il/i documento/i di appartenenza -->
  <!-- default: false() -->
  <xsl:param name="pp_selector_doc_tooltip" select="true()"/>
  <!-- EN: On/Off Search -->
  <!-- IT: Attiva/Disattiva Ricerca -->
  <!-- default: true() -->
  <xsl:param name="search" select="true()"/>
  <!-- EN: On/Off Virtual Keyboard for search -->
  <!-- IT: Attiva/Disattiva Tastiera virtuale per ricerca -->
  <!-- default: true() -->
  <xsl:param name="virtual_keyboard_search" select="false()"/>
  <!-- EN: On/Off Bottom Navbar -->
  <!-- IT: Attiva/Disattiva Barra di navigazione in fondo alla pagina -->
  <!-- default: true() -->
  <xsl:param name="bottom_navbar" select="false()"/>
  <!-- EN: Initial status of Bottom Navbar (only works if $bottom_navbar=true()) -->
  <!-- IT: Stato iniziale della barra di navigazione (considerato solo se $bottom_navbar=true())-->
  <!-- possible values: 'collapsed' | 'expanded' -->
  <!-- default: 'collapsed' -->
  <xsl:param name="bottom_navbar_initial_status" select="'collapsed'"/>

  <!-- EN: On/Off Document Navigation -->
  <!-- IT: Attiva/Disattiva navigazione per documento -->
  <!-- default: false() -->
  <xsl:param name="document_navigation" select="true()"/>
  <!-- EN: On/Off Lines/Prose visualization Button -->
  <!-- IT: Attiva/Disattiva Bottone di visualizzazione Versi/Prosa  -->
  <!-- default: true() -->
  <xsl:param name="prose_verses_toggler" select="true()"/>
  <!-- EN: On/Off Tooltip indicating language encoded with @xml:lang -->
  <!-- IT: Attiva/Disattiva Tooltip per la visualizzazione della lingua degli elementi che presentano @xml:lang  -->
  <!-- default: false() -->
  <xsl:param name="lang_tooltip" select="false()"/>

  <!-- LISTS -->

  <!-- EN: On/Off persons list -->
  <!-- IT: Attiva/disattiva lista persone -->
  <!-- default: true() -->
  <xsl:param name="list_person" select="true()"/>
  <!-- EN: On/Off places list -->
  <!-- IT: Attiva/disattiva lista luoghi -->
  <!-- default: true() -->
  <xsl:param name="list_place" select="false()"/>
  <!-- EN: On/Off orgName list -->
  <!-- IT: Attiva/disattiva lista organizzazioni -->
  <!-- default: true() -->
  <xsl:param name="list_org" select="false()"/>
  <!-- EN: On/Off term list -->
  <!-- IT: Attiva/disattiva lista terms -->
  <!-- default: true() -->
  <xsl:param name="list_term" select="false()"/>
  <!-- EN: On/Off gloss list -->
  <!-- IT: Attiva/disattiva lista glosses -->
  <!-- default: true() -->
  <xsl:param name="list_gloss" select="false()"/>
  <!-- EN: On/Off chronological index for texts -->
  <!-- IT: Attiva/disattiva indice cronologico -->
  <!-- default: true() -->
  <xsl:param name="list_doc" select="false()"/>
  <!-- EN: It is possibile to personalize the elements in the filter
          select element that will select and highlight particular (groups of) words.
          In order to remove an element from the list in the application just remove the element itself.
          In order to add a new element to the list you simply need to know that the tag corresponds to
          the class name that has be given to the html element referring to the particular words to be selected. -->
  <!-- IT: E' possibile personalizzare gli elementi che compariranno nell'elenco dei filtri che
          selezionano particolari paroli o gruppi di parole. Per rimuovere un elemento basta eliminare tutto l'elemento di interesse.
          Per aggiungere un elemento alla lista basta sapere che il tag fa riferimento alla classe data all'elemento
          html con il quale sono state marcate le parole "particolari" da selezionare. -->
  <xsl:variable name="lists" as="element()*">
    <!--<group label="Entités nommées" active="true">-->
    <group label="NAMED_ENTITIES" active="true">
      <persName active="true" label="Divinités"/>
      <!--      <sp active="true" label="Narrateur"/>-->
      <placeName active="false"/>
      <orgName active="false"/>
    </group>
    <group label="INTERESTING_ELEMENTS" active="false">
      <roleName active="true"/>
      <measure active="true"/>
      <date active="true"/>
      <foreign active="true"/>
    </group>
    <!--    <group label="Structure" active="true">
      <milestone active="true"/>
      <div active="true" label="livre" type="textpart" subtype="book"/>
      <date active="false"/>
      <foreign active="false"/>
    </group>-->
    <group label="STAGES" active="false">
      <setting active="true"/>
      <entrance active="true"/>
      <exit active="true"/>
      <business active="true"/>
      <delivery active="true"/>
      <modifier active="true"/>
      <novelistic active="true"/>
      <mixed active="true"/>
    </group>
    <group label="OTHER" active="false">
      <seg active="true" label="METAPHOR" type="metaphor"/>
    </group>
  </xsl:variable>

  <!-- EN: Information about EVT -->
  <!-- IT: Informazioni su EVT  -->
  <xsl:param name="evtTxt">
    <p>EVT (Edition Visualization Technology) is a software for creating and browsing digital
      editions of manuscripts based on text encoded according to the TEI XML schemas and Guidelines.
      This tool was born as part of the DVB (Digital Vercelli Book) project in order to allow the
      creation of a digital edition of the Vercelli Book, a parchment codex of the late tenth
      century, now preserved in the Archivio e Biblioteca Capitolare of Vercelli and regarded as one
      of the four most important manuscripts of the Anglo-Saxon period as regards the transmission
      of poetic texts in the Old English language. </p>
    <p>To ensure that it will be working on all the most recent web browsers, and for as long as
      possible on the World Wide Web itself, EVT is built on open and standard web technologies such
      as HTML, CSS and JavaScript. Specific features, such as the magnifying lens, are entrusted to
      jQuery plugins, again chosen among the open source and best supported ones to reduce the risk
      of future incompatibilities. The general architecture of the software, in any case, is
      modular, so that any component which may cause trouble or turn out to be not completely up to
      the task can be replaced easily.</p>
    <p>For more information about how to use and/or customize EVT please refer to the EVT Manual
      included in the archive you downloaded, in the "doc" folder.</p>
    <p>EVT is used in the following projects:</p>
    <ul>
      <li>
        <a href="http://pelavicino.labcd.unipi.it/" target="blank">Codice Pelavicino Digitale</a>
      </li>
      <li>
        <a href="http://vbd.humnet.unipi.it/" target="blank">Vercelli Book Digitale</a>
      </li>
    </ul>
    <p>EVT has a home page in the <a href="https://sourceforge.net/p/evt-project/" target="blank"
        >SourceForge</a> repository, but development is done on Gitlab and Github: if you are
      interested in learning more about EVT and/or in adapting it to your specific needs please
      contact the project Director, Roberto Rosselli Del Turco <a
        href="mailto:roberto.rossellidelturco@gmail.com" target="_top"
        >roberto.rossellidelturco@gmail.com</a>.</p>
    <p>If you have any suggestions or spot an error/bug please contact us at <a
        href="mailto:evt.developers@gmail.com">evt.developers@gmail.com</a></p>
  </xsl:param>
</xsl:stylesheet>
