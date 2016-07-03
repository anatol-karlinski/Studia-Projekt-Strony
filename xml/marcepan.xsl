<?xml version="1.0"?>
<xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema">

   	<xs:annotation>
      <xs:documentation xml:lang="pl">
         Marcepan - zamowienia.
      </xs:documentation>
 	</xs:annotation>

 	<xs:element name="zamowienia">
 		<xs:complexType>
 			<xs:sequence>
 		 		<xs:element name="zamowienie" type="zamowienie_typ" minOccurs="1" maxOccurs="unbounded"/>
 			</xs:sequence>
 			<xs:attribute ref="naDzien"/>
 			<xs:attribute ref="naMiesiac"/>
 		</xs:complexType>
 	</xs:element>

 	<xs:group name="zamowienie_grupa">
		<xs:sequence>
         <xs:element name="szczegolyZamowienia" type="szczegolyZamowienia_typ"/>
         <xs:element name="daneOdbiorcy" type="daneOdbiorcy_typ"/>
         <xs:element name="kategorie" type="kategorie_typ"/>
         <xs:element name="produkty" type="produkty_typ"/>
         <xs:element name="linkDoStanuZamowienia" type="linkDoStanuZamowienia_typ"/>
      </xs:sequence>
 	</xs:group>

   	<xs:complexType name="zamowienie_typ" mixed="true">
   	  <xs:group ref="zamowienie_grupa"/>
      <xs:attribute name="idZamowienia" type="xs:integer"/>
   	</xs:complexType>

	<xs:complexType name="szczegolyZamowienia_typ">
		<xs:sequence>
			<xs:element name="typZamowienie" type="xs:string" />
			<xs:element name="typRachunku" type="xs:string" />
		</xs:sequence>
	</xs:complexType>

	<xs:complexType name="daneOdbiorcy_typ" mixed="true">
	     <xs:sequence>
			<xs:element name="adres" type="adres_typ"/>
	        <xs:element name="imie" type="xs:string"/>
	        <xs:element name="nazwisko" type="xs:string"/>
	        <xs:element name="email" type="email_typ"/>
	        <xs:element name="telefon" type="telefon_typ"/>
	    </xs:sequence>
	</xs:complexType>

	<xs:complexType name="adres_typ">
		<xs:sequence>
			<xs:element name="wojewodztwo" type="wojewodztwo_type"/>
			<xs:element name="miasto" type="xs:string"/>
			<xs:element name="ulica" type="xs:string"/>
			<xs:element name="kodPocztowy">
			  	<xs:simpleType>
			      <xs:restriction base="xs:string">
			         <xs:pattern value="[0-9]{2}-[0-9]{3}"/>
			      </xs:restriction>
			  	</xs:simpleType>				
			</xs:element>
			<xs:element name="numerBudynku" >
			<xs:simpleType>
				<xs:restriction base="xs:string">
			       <xs:pattern value="[0-9]{2}/[0-9]{1}"/>
			   </xs:restriction>
			</xs:simpleType>
			</xs:element>
		</xs:sequence>
	</xs:complexType>

	<xs:complexType name="kategorie_typ">
		<xs:sequence>
			<xs:element name="kategoria" minOccurs="1" maxOccurs="unbounded">
			<xs:complexType>
				<xs:sequence>
					<xs:element name="rodzaj" type="xs:string"/>
					<xs:element name="typ" type="xs:string"/>
				</xs:sequence>
			</xs:complexType>
			</xs:element>
		</xs:sequence>
	</xs:complexType>

	<xs:complexType name="linkDoStanuZamowienia_typ">
		<xs:sequence>
			<xs:element name="dostawca" type="xs:string" />
			<xs:element ref="link" />
		</xs:sequence>
	</xs:complexType>

	<xs:complexType name="produkty_typ">
		<xs:sequence>
			<xs:element name="produkt" minOccurs="1" maxOccurs="unbounded">
			<xs:complexType mixed="true">
				<xs:sequence>
					<xs:element ref="nazwa"/>
					<xs:element ref="ilosc"/>
					<xs:element ref="grafika"/>
				</xs:sequence>
				<xs:attribute name="nrProduktu" type="xs:integer"/>
			</xs:complexType>
			</xs:element>
		</xs:sequence>
		
	</xs:complexType>	

	<xs:simpleType name="wojewodztwo_type">
		<xs:restriction base="xs:string">
	       <xs:enumeration value="dolnośląskie"/>
	       <xs:enumeration value="kujawsko-pomorskie"/>
	       <xs:enumeration value="lubelskie"/>      
	       <xs:enumeration value="lubuskie"/>
	       <xs:enumeration value="łódzkie"/>
	       <xs:enumeration value="małopolskie"/> 
	       <xs:enumeration value="mazowieckie"/>
	       <xs:enumeration value="opolskie"/> 
	       <xs:enumeration value="podkarpackie"/>
	       <xs:enumeration value="podlaskie"/>
	       <xs:enumeration value="pomorskie"/>      
	       <xs:enumeration value="śląskie"/>
	       <xs:enumeration value="świętokrzyskie"/>
	       <xs:enumeration value="warmińsko-mazurskie"/> 
	       <xs:enumeration value="wielkopolskie"/>
	       <xs:enumeration value="zachodniopomorskie"/> 
    	</xs:restriction>
	</xs:simpleType>

	<xs:simpleType name="miesac_enum">
		<xs:restriction base="xs:string">
	       <xs:enumeration value="styczen"/>
	       <xs:enumeration value="luty"/>
	       <xs:enumeration value="marzec"/>      
	       <xs:enumeration value="kwiecien"/>
	       <xs:enumeration value="maj"/>
	       <xs:enumeration value="czerwiec"/> 
	       <xs:enumeration value="lipiec"/>
	       <xs:enumeration value="sierpien"/> 
	       <xs:enumeration value="wrzesien"/>
	       <xs:enumeration value="pazdziernik"/>
	       <xs:enumeration value="listopad"/>      
	       <xs:enumeration value="grudzien"/>
    	</xs:restriction>
	</xs:simpleType>

	<xs:simpleType name="dzien_enum">
		<xs:restriction base="xs:string">
	       <xs:enumeration value="poniedzialek"/>
	       <xs:enumeration value="wtorek"/>
	       <xs:enumeration value="sroda"/>      
	       <xs:enumeration value="czwartek"/>
	       <xs:enumeration value="piatek"/>
    	</xs:restriction>
	</xs:simpleType>

	<xs:simpleType name="typ_zamowienia">
      <xs:restriction base="xs:string">
       <xs:enumeration value="prywatne"/>
       <xs:enumeration value="firmowe"/>
       <xs:enumeration value="hurtowe"/>      
       <xs:enumeration value="catering"/>
      </xs:restriction>
	</xs:simpleType>

   	<xs:simpleType name="kategoria_type">
      <xs:restriction base="xs:string">
       <xs:enumeration value="torty"/>
       <xs:enumeration value="ciasta"/>
       <xs:enumeration value="kawy"/>      
       <xs:enumeration value="soki"/>
      </xs:restriction>
   	</xs:simpleType>

   	<xs:simpleType name="email_typ">
      <xs:restriction base="xs:string">
         <xs:pattern value="[^@]+@[^\.]+\..+"/> 
      </xs:restriction>
   	</xs:simpleType>

	<xs:simpleType name="ilosc_type">
	    <xs:restriction base="xs:integer">
	      <xs:minInclusive value="0"/>
	      <xs:maxInclusive value="100"/>
	    </xs:restriction>
	</xs:simpleType>

	<xs:simpleType name="telefon_typ">
	   <xs:restriction base="xs:string">
	   		<xs:pattern value="[0-9]{3}-[0-9]{3}-[0-9]{3}"/>
		</xs:restriction>
	</xs:simpleType>

	<xs:simpleType name="atrybut_typu_URI">
		<xs:restriction base="xs:NOTATION">
	         <xs:enumeration value="png"/>
	         <xs:enumeration value="jpeg"/>
	         <xs:enumeration value="html"/>
	         <xs:enumeration value="php"/>
	    </xs:restriction>
	</xs:simpleType>

	<xs:simpleType name="dzien_int">
	  <xs:restriction base="xs:positiveInteger">
	  	<xs:minInclusive value="1" />
	    <xs:maxInclusive value="31"/>
	  </xs:restriction>
	</xs:simpleType>

	<xs:simpleType name="miesiac_int">
	  <xs:restriction base="xs:positiveInteger">
	  	<xs:minInclusive value="1" />
	    <xs:maxInclusive value="12"/>
	  </xs:restriction>
	</xs:simpleType>

	<xs:element name="nazwa" type="xs:string"/>
	<xs:element name="ilosc" type="ilosc_type"/>

	<xs:element name="grafika">
	<xs:complexType>
      <xs:simpleContent>
        <xs:extension base="xs:string">
         <xs:attribute ref="typ"/>
        </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
	</xs:element>

	<xs:element name="link">
	<xs:complexType>
      <xs:simpleContent>
        <xs:extension base="xs:string">
         <xs:attribute ref="typ"/>
        </xs:extension>
      </xs:simpleContent>
    </xs:complexType>
	</xs:element>

 	<xs:attribute name="typ" type="atrybut_typu_URI"/>

 	<xs:attribute name="naDzien">
 	<xs:simpleType>
		<xs:union memberTypes="dzien_int dzien_enum" />
 	</xs:simpleType>
 	</xs:attribute>

 	<xs:attribute name="naMiesiac">
 	<xs:simpleType>
		<xs:union memberTypes="miesiac_int miesac_enum" />
 	</xs:simpleType>
 	</xs:attribute>

	<xs:notation name="png" public="image/png"/>
	<xs:notation name="jpeg" public="image/jpeg"/>
	<xs:notation name="html" public="url/html"/>
	<xs:notation name="php" public="url/php"/>

</xs:schema>
