<p:declare-step xmlns:p="http://www.w3.org/ns/xproc" version="1.0"
                xmlns:c="http://www.w3.org/ns/xproc-step"
                xmlns:cx="http://xmlcalabash.com/ns/extensions"
                exclude-inline-prefixes="cx"
                name="main">
<p:output port="result"/>
<p:serialization port="result" indent="true"/>

<p:import href="http://xmlcalabash.com/extension/steps/metadata-extractor.xpl"/>

<cx:metadata-extractor
    href="https://images.nwalsh.com/images/ndw/2012/01/04/500/6636377145.jpg"/>

<p:identity>
  <p:input port="source" select="/c:metadata/c:tag[@dir='IPTC' and @type='0x0205']"/>
</p:identity>

<p:choose>
  <p:when test="contains(string(/), 'Amaryllis')">
    <p:identity>
      <p:input port="source">
        <p:inline><c:result>PASS</c:result></p:inline>
      </p:input>
    </p:identity>
  </p:when>
  <p:otherwise>
    <p:error code="FAIL">
      <p:input port="source">
        <p:inline><message>Did not find expected text.</message></p:inline>
      </p:input>
    </p:error>
  </p:otherwise>
</p:choose>

</p:declare-step>
