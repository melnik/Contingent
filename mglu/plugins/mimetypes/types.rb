# :title: MIME::Types
# :main: MIME::Types
#--
# MIME::Types for Ruby
# Version 1.005
#
# Copyright (c) 2002 Austin Ziegler
#
# $Id: types.rb,v 1.1.1.1 2003/11/26 11:46:24 av Exp $
#
# ==========================================================================
# Revision History ::
# YYYY.MM.DD    Change ID       Developer
#               Description
# --------------------------------------------------------------------------
# 2003.02.10                    Austin Ziegler
#               Cleaned up types per Perl::Types 1.005. Cleaned up split code
#               so that results are cleaner and more accurate.
# 2002.10.30                    Austin Ziegler
#               Updated to match 1.004 Perl version, links credited to Dan
#               Puro. Adds new reference list to
#               http://www.indiana.edu/cgi-bin-local/mimetypes ... I've kept
#               the same decisions that Mark Overmeer did for the 1.004
#               version.
# 2002.10.22                    Austin Ziegler
#               Removed MIME::InvalidType with TypeError. Changed .type to
#               .class. Cleaned up how simplified versions are created. 
#
# ==========================================================================
#++
module MIME #:nodoc:
    VERSION = '1.005'

        # Reflects a MIME Content-Type which is in invalid format (e.g., it
        # isn't in the form of type/subtype).
    class InvalidContentType < RuntimeError; end

        # = Summary
        # Definition of one MIME content-type
        #
        # = Synopsis
        #  require 'MIME/types'
        #  plaintext = MIME::Types['text/plain']
        #  print plaintext.media_type                    # => 'text'
        #  print plaintext.sub_type                      # => 'plain'
        #
        #  puts plaintext.join(" ")                      # => 'asc txt c cc h hh cpp'
        #
        #  puts plaintext.encoding                       # => 8bit
        #  puts plaintext.binary?                        # => false
        #  puts plaintext.ascii?                         # => true
        #  puts plaintext == 'text/plain'                # => true
        #  puts MIME::Type.simplified('x-appl/x-zip')    # => 'appl/zip'
        #
        # = Description
        # MIME types are used in MIME entities, as in email or HTTP traffic.
        # It is useful at times to have information available about MIME types
        # (or, inversely, about files). A MIME::Type stores the known
        # information about one MIME type.
        #
    class Type
        include Comparable

        @@content_type_re = /^([-\w.+]+)\/([-\w.+]*)$/

        def <=>(other) #:nodoc:
            if other.respond_to? :content_type
                @content_type <=> other.content_type
            elsif String == other.class
                @simplified <=> Type.simplified(other)
            else
                @content_type <=> other
            end
        end

        def eql?(other) #:nodoc:
            other === MIME::Type and self == other
        end

            # The MIME types main- and sub-label can both start with
            # <tt>x-</tt>, which indicates that it is a non-registered name.
            # Of course, after registration this flag can disappear which adds
            # to the confusion. The simplified string has the <tt>x-</tt>
            # removed and are translated to lowercase.
        def Type.simplified(content_type)
            md = @@content_type_re.match(content_type)
            if not md.nil?
                mt = md[1]
                st = md[2]
                s = ""
                s << mt.downcase.gsub(/^x-/, '') << '/' << st.downcase.gsub(/^x-/, '')
            else
                nil
            end
        end

            # Returns the whole MIME content-type string.
        attr_reader :content_type
            # Returns the media type of the simplified MIME type. For
            # <tt>text/plain</tt>, it will return +text+.
        attr_reader :media_type
            # Returns the sub-type of the simplified MIME type. For
            # <tt>text/plain</tt>, it will return +plain+.
        attr_reader :sub_type
            # The MIME types main- and sub-label can both start with
            # <tt>x-</tt>, which indicates that it is a non-registered name.
            # Of course, after registration this flag can disappear which adds
            # to the confusion. The simplified string has the <tt>x-</tt>
            # removed and are translated to lowercase.
        attr_reader :simplified
            # Returns a list of extensions which are known to be used for this
            # MIME type.
        attr_reader :extensions
            # Returns the type of encoding which is required to transport data
            # of this type safely.
        attr_reader :encoding
            # Returns the regular expression which can be used to determine
            # whether this type is active on the system where you are working
            # on.
        attr_reader :system

    private
            # Sets the list of extensions known for a particular MIME
            # content-type. <b>Only works in constructor block.</b>
        def init_extensions(ext) #:doc:
            @extensions = [ext].flatten.compact unless ext.nil?
        end

            # Sets the encoding for a particular MIME content-type. <b>Only
            # works in constructor block.</b>
        def init_encoding(enc) #:doc:
            @encoding = enc unless enc.nil?
        end

            # Sets the operating system known for a particular MIME
            # content-type. This value is used to allow for multiple
            # definitions of some MIME content-types, where the standard
            # extensions and/or encodings are different (e.g., text/plain on
            # VMS systems). <b>Only works in constructor block.</b>
        def init_system(os) #:doc:
            @system = os unless os.nil?
        end

        def __create(content_type, &block) #:nodoc:
            @@content_type_re.match(content_type)
            if not $~
                raise InvalidContentType,
                  "Invalid Content-Type provided ('#{content_type}')"
            end
            @media_type = $1
            @sub_type = $2
            @content_type = content_type

            @simplified = Type.simplified(@content_type)

            init_extensions([])
            init_encoding((@media_type == 'text') ? 'quoted-printable' :
                                                    'base64')
            init_system(nil)
            instance_eval(&block) unless block.nil?
        end

    public
            # This constructor takes advantage of a technique for Ruby object
            # construction introduced by Andy Hunt and Dave Thomas (see
            # reference), where optional values are set using commands in a
            # block. 
            #
            #   MIME::Type.new("application/x-eruby") {
            #       init_extensions("rhtml")
            #       init_encoding("8bit")
            #   }
            #
            # The available functions (which *only* work in the constructor
            # block, as they are private) are:
            # <tt>#init_extensions</tt>::   Sets the list of extensions known
            #                               for a particular MIME content-type.
            # <tt>#init_encoding</tt>::     Sets the encoding for a particular
            #                               MIME content-type.
            # <tt>#init_system</tt>::       Sets the operating system known
            #                               for a particular MIME
            #                               content-type. This value is used
            #                               to allow for multiple definitions
            #                               of some MIME content-types, where
            #                               the standard extensions and/or
            #                               encodings are different (e.g.,
            #                               text/plain on VMS systems).
            #
            # +arg+ may also be one of MIME::Type, Array, or Hash.
            # [MIME::Type]  Equivalent to a copy constructor.
            #   MIME::Type.new(plaintext)
            # [Array]       A four-element array in the form of:
            #               [type-name, [extensions], encoding, system]
            #   MIME::Type.new(["application/x-ruby", ["rb"], "8bit"])
            # [Hash]        A hash with the following keys:
            #
            #               <tt>Content-Type</tt> (*or*:
            #               <tt>content-type</tt>, +content_type+, +type+):
            #               String
            #
            #               +Extensions+ (*or*: +extensions+): Array of String
            #
            #               <tt>Content-Transfer-Encoding</tt> (*or*:
            #               <tt>content-transfer-encoding</tt>,
            #               +content_encoding+, +encoding+): String
            #
            #               +System+ (*or*: +system+): String
            #
            #   MIME::Type.new('Content-Type' => 'text/x-yaml',
            #                  'Content-Transfer-Encoding' => '8bit',
            #                  'System' => 'linux',
            #                  'Extensions' => ['yaml', 'yml'])
            #
            # *Notes*:: If the encoding is not specified, then it will be
            #           defaulted to 'quoted-printable' for 'text/*' media
            #           types and 'base64' for every other type.
            #
            # *Reference*:: "Object Construction and Blocks"
            #               <http://www.pragmaticprogrammer.com/ruby/articles/insteval.html>
            #
        def initialize(arg, &block)
            case arg
                when MIME::Type
                    __create(arg.content_type) do
                        init_extensions(arg.extensions)
                        init_encoding(arg.encoding)
                        init_system(arg.system)
                    end
                when Array
                    __create(arg[0]) do
                        init_extensions(arg[1])
                        init_encoding(arg[2])
                        init_system(arg[3])
                    end
                when Hash
                    cty = arg.key?('type') ? arg['type'] :
                            arg.key?('content-type') ? arg['content-type'] :
                            arg.key?('Content-Type') ? arg['Content-Type'] :
                            arg.key?('content_type') ? arg['content_type'] :
                            nil
                    ext = arg.key?('extensions') ? arg['extensions'] :
                            arg.key?('Extensions') ? arg['Extensions'] : nil
                    [arg['extensions']].flatten
                    enc = arg.key?('encoding') ? arg['encoding'] :
                            arg.key?('content-transfer-encoding') ? 
                                arg['content-transfer-encoding'] :
                            arg.key?('Content-Transfer-Encoding') ? 
                                arg['Content-Transfer-Encoding'] :
                            arg.key?('content_encoding') ?
                                arg['content_encoding'] : nil
                    osy = arg.key?('system') ? arg['system'] :
                            arg.key?('System') ? arg['System'] : nil

                    __create(cty) do
                        init_extensions(ext)
                        init_encoding(enc)
                        init_system(osy)
                    end
                when String
                    __create(arg, &block)
                else
                    raise TypeError,
                          "Received #{arg.class} when expecting " \
                          "MIME::Type, Array, Hash, or String only."
                end
        end

            # MIME content-types which are not regestered by IANA nor defined
            # in RFCs are required to start with <tt>x-</tt>. This counts as
            # well for a new media type as well as a new sub-type of an
            # existing media type. If either the media-type or the
            # content-type begins with <tt>x-</tt>, this method will return
            # +false+.
        def registered?
            not (@content_type =~ /^[xX]-\//) ||
                (@content_type =~ /\/[xX]-/)
        end

            # MIME types can be specified to be sent across a network in
            # particular formats. This method returns +true+ when the MIME
            # type encoding is set to <tt>base64</tt> or +binary+.
            #
            # *Notes*:: This is a slightly expanded test to the one defined in
            #           the Perl MIME::Type library, as it includes +binary+.
        def binary?
            (@encoding == 'base64') || (@encoding == 'binary')
        end

            # MIME types can be specified to be sent across a network in
            # particular formats. This method returns +false+ when the MIME
            # type encoding is set to <tt>base64</tt> or +binary+.
            #
            # *Notes*:: This is a slightly different test than the one defined
            #           in the Perl MIME::Type library, as it is merely a
            #           reverse of #binary?.
        def ascii?
            not binary?
        end

            # Returns +true+ when the MIME type is in the list of known
            # digital signatures.
        def signature?
            case @content_type
                when "application/pgp-keys", "application/pgp",
                     "application/pgp-signature", "application/pkcs10",
                     "application/pkcs7-mime", "application/pkcs7-signature",
                     "text/vCard", "text/vcard"
                    true
            end
        end

        def to_s #:nodoc:
            @content_type
        end
    end

        # = Introduction
        #
        # MIME::Types provides the ability for detailed information about MIME
        # entities to be determined and used programmatically.
        #
        # This is based on Perl MIME::Types 1.005 and reflects this heritage
        # in the existence of both MIME::Types and MIME::Type (which is the
        # definition of a single MIME type). As with the Perl version, this
        # module is built to conform with MIME types in RFC 2045 and 2231.
        # This library follows the collection of MIME types at the USC
        # Information Sciences Institute (see below for reference).
        #
        # Copyright::   Copyright (c) 2002 by Austin Ziegler
        # Version::     1.005
        # Based On::    Perl
        #               MIME::Types[http://search.cpan.org/author/MARKOV/MIME-Types-1.005/MIME/Types.pm],
        #               Copyright (c) 2001-2002 by Jeff Okamoto and Mark
        #               Overmeer.
        # Licence::     Ruby's, Perl Artistic, or GPL version 2 (or later)
        # See Also::    ftp://ftp.isi.edu/in-notes/iana/assignments/media-types/media-types
        #               http://www.indiana.edu/cgi-bin-local/mimetypes
        #
    module Types
            # Build the type list
    private
        @@data_mime_type = <<EOS
application/access	mdf
application/activemessage
application/andrew-inset	ez
application/applefile		base64
application/atomicmail
application/batch-SMTP
application/beep+xml
application/bleeper	bleep	base64
application/cals-1840
application/cnrp+xml
application/commonground
application/cpl+xml
application/cu-seeme	csm,cu
application/cybercash
application/dca-rft
application/dec-dx
application/EDI-Consent
application/EDIFACT
application/EDI-X12
application/eshop
application/excel	xls,xlt	base64
application/font-tdpfr	pfr
application/futuresplash	spl
application/ghostview
application/hep	hep
application/http
application/hyperstudio	stk
application/iges
application/imagemap	imagemap,imap	8bit
application/index
application/index.cmd
application/index.obj
application/index.response
application/index.vnd
application/iotp
application/ipp
application/isup
application/lotus-123	wks
application/mac-binhex40	hqx	8bit
application/mac-compactpro	cpt
application/macwriteii
application/marc
application/mathematica
application/mathcad	mcd	base64
application/mathematica-old
application/msword	doc,dot,wrd	base64
application/news-message-id
application/news-transmission
application/ocsp-request
application/ocsp-response
application/octet-stream	bin,dms,lha,lzh,exe,class,ani	base64
application/oda	oda
application/parityfec
application/pdf	pdf	base64
application/pagemaker	pm5,pt5,pm
application/pgp-encrypted
application/pgp-keys
application/pgp
application/pgp-signature	pgp	8bit
application/pkcs10
application/pkcs7-mime
application/pkcs7-signature
application/pkix-cert
application/pkixcmp
application/pkix-crl
application/postscript	ai,eps,ps	8bit
application/postscript	ps-z	base64
application/powerpoint	ppt,pps,pot	base64
application/prs.alvestrand.titrax-sheet
application/prs.cww	cw,cww
application/prs.nprend	rnd,rct
application/qsig
application/remote-printing
application/riscos
application/rtf	rtf	8bit
application/sdp
application/set-payment
application/set-payment-initiation
application/set-registration
application/set-registration-initiation
application/sgml
application/sgml-open-catalog	soc
application/slate
application/smil	smi,smil
application/timestamp-query
application/timestamp-reply
application/toolbook	tbk
application/tve-trigger
application/vemmi
application/VMSBACKUP	bck	base64
application/vnd.3gpp.pic-bw-large	plb
application/vnd.3gpp.pic-bw-small	psb
application/vnd.3gpp.pic-bw-var	pvb
application/vnd.3gpp.sms	sms
application/vnd.3M.Post-it-Notes
application/vnd.accpac.simply.aso
application/vnd.accpac.simply.imp
application/vnd.acucobol
application/vnd.acucorp	atc,acutc	7bit
application/vnd.adobe.xfdf	xfdf
application/vnd.aether.imp
application/vnd.amiga.amu	ami
application/vnd.anser-web-certificate-issue-initiation
application/vnd.anser-web-funds-transfer-initiation
application/vnd.audiograph
application/vnd.blueice.multipass	mpm
application/vnd.bmi
application/vnd.businessobjects
application/vnd.canon-cpdl
application/vnd.canon-lips
application/vnd.cinderella	cdy
application/vnd.claymore
application/vnd.commerce-battelle
application/vnd.commonspace
application/vnd.comsocaller
application/vnd.contact.cmsg
application/vnd.cosmocaller
application/vnd.ctc-posml
application/vnd.cups-postscript
application/vnd.cups-raster
application/vnd.cups-raw
application/vnd.curl	curl
application/vnd.cybank
application/vnd.data-vision.rdz	rdz
application/vnd.dna
application/vnd.dpgraph
application/vnd.dreamfactory	dfac
application/vnd.dxr
application/vnd.ecdis-update
application/vnd.ecowin.chart
application/vnd.ecowin.filerequest
application/vnd.ecowin.fileupdate
application/vnd.ecowin.series
application/vnd.ecowin.seriesrequest
application/vnd.ecowin.seriesupdate
application/vnd.enliven
application/vnd.epson.esf
application/vnd.epson.msf
application/vnd.epson.quickanime
application/vnd.epson.salt
application/vnd.epson.ssf
application/vnd.ericsson.quickcall
application/vnd.eudora.data
application/vnd.fdf
application/vnd.ffsns
application/vnd.FloGraphIt
application/vnd.framemaker
application/vnd.fsc.weblauch	fsc	7bit
application/vnd.fujitsu.oasys
application/vnd.fujitsu.oasys2
application/vnd.fujitsu.oasys3
application/vnd.fujitsu.oasysgp
application/vnd.fujitsu.oasysprs
application/vnd.fujixerox.ddd
application/vnd.fujixerox.docuworks
application/vnd.fujixerox.docuworks.binder
application/vnd.fut-misnet
application/vnd.grafeq
application/vnd.groove-account
application/vnd.groove-help
application/vnd.groove-identity-message
application/vnd.groove-injector
application/vnd.groove-tool-message
application/vnd.groove-tool-template
application/vnd.groove-vcard
application/vnd.hbci	hbci,hbc,kom,upa,pkd,bpd
application/vnd.hhe.lesson-player	les
application/vnd.hp-HPGL	plt,hpgl	
application/vnd.hp-hpid
application/vnd.hp-hps
application/vnd.hp-PCL
application/vnd.hp-PCLXL
application/vnd.httphone
application/vnd.hzn-3d-crossword
application/vnd.ibm.afplinedata
application/vnd.ibm.electronic-media	emm
application/vnd.ibm.MiniPay
application/vnd.ibm.modcap
application/vnd.ibm.secure-container	sc
application/vnd.informix-visionary
application/vnd.intercon.formnet
application/vnd.intertrust.digibox
application/vnd.intertrust.nncp
application/vnd.intu.qbo
application/vnd.intu.qfx
application/vnd.irepository.package+xml	irp
application/vnd.is-xpr
application/vnd.japannet-directory-service
application/vnd.japannet-jpnstore-wakeup
application/vnd.japannet-payment-wakeup
application/vnd.japannet-registration
application/vnd.japannet-registration-wakeup
application/vnd.japannet-setstore-wakeup
application/vnd.japannet-verification
application/vnd.japannet-verification-wakeup
application/vnd.jisp	jisp
application/vnd.kde.karbon	karbon
application/vnd.kde.kchart	chrt
application/vnd.kde.kformula	kfo
application/vnd.kde.kivio	flw
application/vnd.kde.kontour	kon
application/vnd.kde.kpresenter	ksp
application/vnd.kde.kspread	ksp
application/vnd.kde.kword	kwd,kwt
application/vnd.kenameapp	htke
application/vnd.koan
application/vnd.llamagraphics.life-balance.desktop	lbd
application/vnd.lotus-1-2-3
application/vnd.lotus-approach
application/vnd.lotus-freelance
application/vnd.lotus-notes
application/vnd.lotus-organizer
application/vnd.lotus-screencam
application/vnd.lotus-wordpro
application/vnd.mcd
application/vnd.mediastation.cdkey
application/vnd.meridian-slingshot
application/vnd.micrografx.flo	flo
application/vnd.micrografx.igx	igx
application/vnd.mif	mif
application/vnd.minisoft-hp3000-save
application/vnd.mitsubishi.misty-guard.trustweb
application/vnd.mobius.DAF
application/vnd.mobius.DIS
application/vnd.mobius.MBK
application/vnd.mobius.MQV
application/vnd.mobius.MSL
application/vnd.mobius.PLC
application/vnd.mobius.TXF
application/vnd.mophun.application	mpn
application/vnd.mophun.certificate	mpc
application/vnd.motorola.flexsuite
application/vnd.motorola.flexsuite.adsi
application/vnd.motorola.flexsuite.fis
application/vnd.motorola.flexsuite.gotap
application/vnd.motorola.flexsuite.kmr
application/vnd.motorola.flexsuite.ttc
application/vnd.motorola.flexsuite.wem
application/vnd.mozilla.xul+xml	xul
application/vnd.ms-artgalry	cil
application/vnd.ms-access	mda,mdb,mde
application/vnd.ms-asf	asf
application/vnd.mseq	mseq
application/vnd.ms-excel	xls,xlt
application/vnd.msign
application/vnd.ms-lrm	lrm
application/vnd.ms-powerpoint	ppt,pps,pot
application/vnd.ms-project	mpp
application/vnd.ms-tnef
application/vnd.ms-works
application/vnd.ms-wpl	wpl
application/vnd.musician
application/vnd.music-niff
application/vnd.netfpx
application/vnd.noblenet-directory
application/vnd.noblenet-sealer
application/vnd.noblenet-web
application/vnd.novadigm.EDM
application/vnd.novadigm.EDX
application/vnd.novadigm.EXT
application/vnd.obn
application/vnd.osa.netdeploy
application/vnd.palm	prc,pdb,pqa,oprc
application/vnd.pg.format
application/vnd.pg.osasli
application/vnd.powerbuilder6
application/vnd.powerbuilder6-s
application/vnd.powerbuilder7
application/vnd.powerbuilder75
application/vnd.powerbuilder75-s
application/vnd.powerbuilder7-s
application/vnd.previewsystems.box
application/vnd.publishare-delta-tree
application/vnd.pvi.ptid1	pti,ptid
application/vnd.pwg-multiplexed
application/vnd.pwg-xmhtml-print+xml
application/vnd.Quark.QuarkXPress	qxd,qxt,qwd,qwt,qxl,qxb	8bit
application/vnd.rapid
application/vnd.s3sms
application/vnd.seemail
application/vnd.sealed.net
application/vnd.shana.informed.formdata
application/vnd.shana.informed.formtemplate
application/vnd.shana.informed.interchange
application/vnd.shana.informed.package
application/vnd.smaf	mmf
application/vnd.sss-cod
application/vnd.sss-dtf
application/vnd.sss-ntf
application/vnd.street-stream
application/vnd.svd
application/vnd.swiftview-ics
application/vnd.triscape.mxs
application/vnd.trueapp
application/vnd.truedoc
application/vnd.ufdl
application/vnd.uplanet.alert
application/vnd.uplanet.alert-wbxml
application/vnd.uplanet.bearer-choice
application/vnd.uplanet.bearer-choice-wbxml
application/vnd.uplanet.cacheop
application/vnd.uplanet.cacheop-wbxml
application/vnd.uplanet.channel
application/vnd.uplanet.channel-wbxml
application/vnd.uplanet.list
application/vnd.uplanet.listcmd
application/vnd.uplanet.listcmd-wbxml
application/vnd.uplanet.list-wbxml
application/vnd.uplanet.signal
application/vnd.vcx
application/vnd.vectorworks
application/vnd.vidsoft.vidconference	vsc	8bit
application/vnd.visio	vsd,vst,vsw,vss
application/vnd.visionary	vis
application/vnd.vividence.scriptfile
application/vnd.vsf
application/vnd.wap.sic	sic
application/vnd.wap.slc	slc
application/vnd.wap.wbxml	wbxml
application/vnd.wap.wmlc	wmlc
application/vnd.wap.wmlscriptc	wmlsc
application/vnd.webturbo
application/vnd.wrq-hp3000-labelled
application/vnd.wt.stf
application/vnd.xara
application/vnd.xfdl
application/vnd.yellowriver-custom-menu
application/whoispp-query
application/whoispp-response
application/wita
application/wordperfect	wp
application/wordperfect5.1	wp5
application/wordperfect6.1	wp6
application/wordperfectd	wpd
application/x-123	wk
application/x400-bp
application/x-bcpio	bcpio
application/x-bzip2	bz2
application/x-cdlink	vcd
application/x-chess-pgn	pgn
application/x-compress
application/x-compress	z,Z	base64
application/x-cpio	cpio	base64
application/x-csh	csh	8bit
application/x-debian-package	deb
application/x-director	dcr,dir,dxr
application/x-dvi	dvi	base64
application/x-futuresplash	spl
application/x-gtar	gtar,tgz,tbz2,tbz	base64
application/x-gunzip
application/x-gzip	gz	base64
application/x-hdf	hdf
application/xhtml+xml	xhtml	8bit
application/x-httpd-php	phtml,pht,php	8bit
application/x-ica	ica
application/x-javascript	js	8bit
application/x-koan	skp,skd,skt,skm
application/x-latex	latex	8bit
application/x-maker	frm,maker,frame,fm,fb,book,fbdoc
application/x-mif	mif
application/xml
application/xml-dtd
application/xml-external-parsed-entity
application/x-msdos-program	com,bat	8bit
application/x-msdos-program	exe	base64
application/x-msdownload	exe	base64
application/x-netcdf	nc,cdf
application/x-ns-proxy-autoconfig	pac
application/x-perl	pl,pm	8bit
application/quicktimeplayer	qtl
application/x-rar-compressed	rar	base64
application/x-shar	shar	8bit
application/x-shockwave-flash	swf
application/x-sh	sh	8bit
application/x-spss	sav,spp,sbs,sps,spo
application/x-stuffit	sit	base64
application/x-sv4cpio	sv4cpio	base64
application/x-sv4crc	sv4crc	base64
application/x-tar	tar	base64
application/x-tcl	tcl	8bit
application/x-texinfo	texinfo,texi	8bit
application/x-tex	tex	8bit
application/x-troff-man	man	8bit
application/x-troff-me	me
application/x-troff-ms	ms
application/x-troff	t,tr,roff	8bit
application/x-ustar	ustar	base64
application/x-wais-source	src
application/x-Wingz	wz
application/x-x509-ca-cert	crt	base64
application/zip	zip	base64
audio/32kadpcm
audio/amr	amr	base64
audio/amr-wb	awb	base64
audio/basic	au,snd	base64
audio/CN
audio/DAT12
audio/DVI4
audio/G.722.1
audio/G722
audio/G723
audio/G726-16
audio/G726-24
audio/G726-32
audio/G726-40
audio/G728
audio/G729
audio/G729D
audio/G729E
audio/GSM
audio/GSM-EFR
audio/l16	l16
audio/l20
audio/l24
audio/midi	mid,midi,kar	base64
audio/MP4A-LATM
audio/MPA
audio/mpa-robust
audio/mpeg	mpga,mp2,mp3	base64
audio/parityfec
audio/PCMA
audio/PCMU
audio/prs.sid	sid,psid
audio/QCELP
audio/RED
audio/telephone-event
audio/tone
audio/VDVI
audio/vnd.3gpp.iufp
audio/vnd.cisco.nse
audio/vnd.cns.anp1
audio/vnd.cns.inf1
audio/vnd.digital-winds	eol	7bit
audio/vnd.everad.plj	plj
audio/vnd.lucent.voice	lvp
audio/vnd.nortel.vbk	vbk
audio/vnd.nuera.ecelp4800	ecelp4800
audio/vnd.nuera.ecelp7470	ecelp7470
audio/vnd.nuera.ecelp9600	ecelp9600
audio/vnd.octel.sbc
audio/vnd.qcelp	qcp
audio/vnd.rhetorex.32kadpcm
audio/vnd.vmx.cvsd
audio/x-aiff	aif,aifc,aiff	base64
audio/x-pn-realaudio-plugin	rpm
audio/x-pn-realaudio	rm,ram	base64
audio/x-realaudio	ra	base64
audio/x-wav	wav	base64
chemical/x-pdb	pdb
chemical/x-xyz	xyz
drawing/dwf	dwf
image/bmp	bmp
image/cgm
image/g3fax
image/gif	gif	base64
image/ief	ief	base64
image/jpeg	jpeg,jpg,jpe	base64
image/naplps
image/png	png	base64
image/prs.btif
image/prs.pti
image/t38
image/tiff	tiff,tif	base64
image/tiff-fx
image/vnd.cns.inf2
image/vnd.djvu	djvu,djv
image/vnd.dgn	dgn
image/vnd.dwg	dwg
image/vnd.dxf
image/vnd.fastbidsheet
image/vnd.fpx
image/vnd.fst
image/vnd.fujixerox.edmics-mmr
image/vnd.fujixerox.edmics-rlc
image/vnd.glocalgraphics.pgb	pgb
image/vnd.mix
image/vnd.net-fpx
image/vnd.svf
image/vnd.wap.wbmp	wbmp
image/vnd.xiff
image/x-cmu-raster	ras
image/x-portable-anymap	pnm	base64
image/x-portable-bitmap	pbm	base64
image/x-portable-graymap	pgm	base64
image/x-portable-pixmap	ppm	base64
image/x-rgb	rgb	base64
image/x-xbitmap	xbm	7bit
image/x-xpixmap	xpm	8bit
image/x-xwindowdump	xwd	base64
image/x-paintshoppro	psp	base64
message/delivery-status
message/disposition-notification
message/external-body		8bit
message/http
message/news		8bit
message/partial		8bit
message/rfc822		8bit
message/s-http
message/sipfrag
message/sip
model/iges	igs,iges
model/mesh	msh,mesh,silo
model/vnd.dwf
model/vnd.flatland.3dml
model/vnd.gdl
model/vnd.gs-gdl
model/vnd.gtw
model/vnd.mts
model/vnd.parasolid.transmit.binary	x_b,xmt_bin
model/vnd.parasolid.transmit.text	x_t,xmt_txt	quoted-printable
model/vnd.vtu
model/vrml	wrl,vrml
multipart/alternative		8bit
multipart/appledouble		8bit
multipart/byteranges
multipart/digest		8bit
multipart/encrypted
multipart/form-data
multipart/header-set
multipart/mixed		8bit
multipart/parallel		8bit
multipart/related
multipart/report
multipart/signed
multipart/voice-message
text/calendar
text/css	css	8bit
text/comma-separated-values	csv	8bit
text/directory
text/enriched
text/html	html,htm,htmlx,shtml,htx	8bit
text/plain	asc,txt,c,cc,h,hh,cpp,hpp,dat,hlp	8bit
text/prs.lines.tag
text/rfc822-headers
text/richtext	rtx	8bit
text/rtf	rtf
text/sgml	sgml,sgm
text/t140
text/tab-separated-values	tsv
text/uri-list
text/vnd.abc
text/vnd.curl
text/vnd.DMClientScript
text/vnd.flatland.3dml
text/vnd.fly
text/vnd.fmi.flexstor
text/vnd.in3d.3dml
text/vnd.in3d.spot
text/vnd.IPTC.NewsML
text/vnd.IPTC.NITF
text/vnd.latex-z
text/vnd.motorola.reflex
text/vnd.ms-mediapackage
text/vnd.net2phone.commcenter.command	ccc
text/vnd.sun.j2me.app-descriptor	jad	8bit
text/vnd.wap.si	si
text/vnd.wap.sl	sl
text/vnd.wap.wmlscript	wmls
text/vnd.wap.wml	wml
text/xml	xml,dtd	8bit
text/xml-external-parsed-entity
text/x-setext	etx
text/x-sgml	sgml,sgm	8bit
text/x-vCalendar	vcs	8bit
text/x-vCard	vcf	8bit
video/dl	dl	base64
video/fli	fli	base64
video/gl	gl	base64
video/mpeg	mp2,mpe,mpeg,mpg	base64
video/pointer
video/quicktime	qt,mov	base64
video/vnd.fvt	fvt
video/vnd.motorola.video
video/vnd.motorola.videop
video/vnd.mpegurl	mxu,m4u	8bit
video/vnd.nokia.interleaved-multimedia	nim
video/vnd.objectvideo	mp4
video/vnd.vivo
video/x-ms-asf	asf,asx
video/x-msvideo	avi	base64
video/x-sgi-movie	movie	base64
x-conference/x-cooltalk	ice
x-world/x-vrml	wrl,vrml

# Exceptions
vms:text/plain	doc	8bit
mac:application/x-macbase64	bin
EOS

        @@type_list = Hash.new([])
        @@type_index = Hash.new([])

        def Types.add_to_type_list(mime_type)
            if mime_type.class == MIME::Type
                if @@type_list.include? mime_type.simplified
                    @@type_list[mime_type.simplified] << mime_type
                else
                    @@type_list[mime_type.simplified] = [mime_type]
                end
            else
                raise TypeError, "Expecting MIME::Type only"
            end
        end

        if !@@type_list.keys.nil?
            @@data_mime_type.each do |i|
                item = i.chomp.strip.gsub(/#.*/, '')
                next if item =~ /^$/

                os = item.gsub!(/^(\w+):/, '') ? $1 : nil

                ctype, ext, enc = item.split(/\s/)
                exts = ext ? [ ext.split(/,/) ] : nil

                mime_type = MIME::Type.new(ctype) do
                    init_extensions(exts)
                    init_encoding(enc)
                    init_system(os)
                end

                MIME::Types.add_to_type_list(mime_type)
            end
        end

        @@data_mime_type = true

        def Types.add_to_type_index(mime_type)
            if mime_type.class == MIME::Type
                mime_type.extensions.each do |ext|
                    if @@type_index.include? ext 
                        if @@type_index[ext].class == Array
                            @@type_index[ext] << mime_type
                        else
                            @@type_index[ext] = [@@type_index[ext], mime_type]
                        end
                    else
                        @@type_index[ext] = mime_type
                    end
                end
            else
                raise TypeError, "Expecting MIME::Type only"
            end
        end

            # Build the type/extension index
        os_specific = []
        @@type_list.each do |simple, definitions|
            definitions.each do |mime_type|
                if not mime_type.system.nil?
                    if mime_type.system =~ Regexp.new(RUBY_PLATFORM)
                        os_specific << mime_type
                    end
                else
                    MIME::Types.add_to_type_index(mime_type)
                end
            end
        end

        os_specific.each do |mime_type|
            MIME::Types.add_to_type_index(mime_type)
        end

    public
            # Return the MIME::Type which describes the type related to the
            # provided string or regular expression. If a string is provided,
            # it must match *exactly*, or +nil+ will be returned. It is
            # possible for multiple matches to be returned for either type (in
            # the example below, 'text/plain' returns two values -- one for
            # the general case, and one for VMS systems. <b>Do not assume a
            # single MIME::Type will be returned.</b>
            #
            #   puts "\nMIME::Types['text/plain']"
            #   MIME::Types['text/plain'].each { |t| puts mt_flags(t) }
            #
            #   puts "\nMIME::Types[/^image/] (block filters for extensions)"
            #   MIME::Types[/^image/].each { |t|
            #       puts mt_flags(t) unless t.extensions.empty?
            #   }
        def Types.[](type_string)
            if type_string.class == Regexp
                matches = []
                @@type_list.each_key do |k|
                    matches << @@type_list[k] if k =~ type_string
                end
                matches.flatten!
            else
                mime = MIME::Type.simplified(type_string)
                @@type_list[mime]
            end
        end

            # Return the MIME::Type which belongs to the file based on its
            # filename extension.
            #
            #   puts "MIME::Types.type_for('citydesk.xml') => " \
            #        "#{MIME::Types.type_for('citydesk.xml')}"
            #   puts "MIME::Types.type_for('citydesk.gif') => " \
            #        "#{MIME::Types.type_for('citydesk.gif')}"
        def Types.type_for(filename)
            fn = filename.chomp.downcase.gsub(/.*\./, '')
            if @@type_index.include?(fn)
                @@type_index[fn]
            else
                nil
            end
        end

            # A synonym for MIME::Types.type_for
        def Types.of(filename)
            Types.type_for(filename)
        end

            # Add one or more MIME::Type objects to the set of known types.
            # Each type should be experimental.
            #
            # <b>Please inform the maintainer of this module when registered
            # types are missing.</b>
        def Types.add(*types)
            types.each do |arg|
                mime_type = MIME::Type.new(arg)
                MIME::Types.add_to_type_list(mime_type)
                MIME::Types.add_to_type_index(mime_type)
            end
        end
    end

end

if __FILE__ == $0
    require 'test/unit'

    class TestMIME__Type < Test::Unit::TestCase #:nodoc:
        def test_CMP # '<=>'
            assert(MIME::Type.new('text/plain') == MIME::Type.new('text/plain'))
            assert(MIME::Type.new('text/plain') != MIME::Type.new('image/jpeg'))
            assert(MIME::Type.new('text/plain') == 'text/plain')
            assert(MIME::Type.new('text/plain') != 'image/jpeg')
            assert(MIME::Type.new('text/plain') > MIME::Type.new('text/html'))
            assert(MIME::Type.new('text/plain') > 'text/html')
            assert(MIME::Type.new('text/html') < MIME::Type.new('text/plain'))
            assert(MIME::Type.new('text/html') < 'text/plain')
        end

        def test_ascii?
            assert(MIME::Type.new('text/plain').ascii?)
            assert(!MIME::Type.new('image/jpeg').ascii?)
            assert(!MIME::Type.new('application/x-msword').ascii?)
            assert(MIME::Type.new('text/vCard').ascii?)
            assert(!MIME::Type.new('application/pkcs7-mime').ascii?)
        end

        def test_binary?
            assert(!MIME::Type.new('text/plain').binary?)
            assert(MIME::Type.new('image/jpeg').binary?)
            assert(MIME::Type.new('application/x-msword').binary?)
            assert(!MIME::Type.new('text/vCard').binary?)
            assert(MIME::Type.new('application/pkcs7-mime').binary?)
        end

        def test_content_type
            assert_equal(MIME::Type.new('text/plain').content_type, 'text/plain')
            assert_equal(MIME::Type.new('image/jpeg').content_type, 'image/jpeg')
            assert_equal(MIME::Type.new('application/x-msword').content_type, 'application/x-msword')
            assert_equal(MIME::Type.new('text/vCard').content_type, 'text/vCard')
            assert_equal(MIME::Type.new('application/pkcs7-mime').content_type, 'application/pkcs7-mime')
        end

        def test_encoding
            assert_equal(MIME::Type.new('text/plain').encoding, 'quoted-printable')
            assert_equal(MIME::Type.new('image/jpeg').encoding, 'base64')
            assert_equal(MIME::Type.new('application/x-msword').encoding, 'base64')
            assert_equal(MIME::Type.new('text/vCard').encoding, 'quoted-printable')
            assert_equal(MIME::Type.new('application/pkcs7-mime').encoding, 'base64')
        end

        def test_eql?
            assert(MIME::Type.new('text/plain').eql?(MIME::Type.new('text/plain')))
            assert(!MIME::Type.new('text/plain').eql?(MIME::Type.new('image/jpeg')))
            assert(!MIME::Type.new('text/plain').eql?('text/plain'))
            assert(!MIME::Type.new('text/plain').eql?('image/jpeg'))
        end

        def test_extensions
            yaml = MIME::Type.new(['text/x-yaml', ['yaml', 'yml'], '8bit',
                                'linux'])
            assert_equal(yaml.extensions, ['yaml', 'yml'])
        end

        def test_media_type
            assert_equal(MIME::Type.new('text/plain').media_type, 'text')
            assert_equal(MIME::Type.new('image/jpeg').media_type, 'image')
            assert_equal(MIME::Type.new('application/x-msword').media_type, 'application')
            assert_equal(MIME::Type.new('text/vCard').media_type, 'text')
            assert_equal(MIME::Type.new('application/pkcs7-mime').media_type, 'application')
        end

        def test_registered?
            assert(MIME::Type.new('text/plain').registered?)
            assert(MIME::Type.new('image/jpeg').registered?)
            assert(!MIME::Type.new('application/x-msword').registered?)
            assert(MIME::Type.new('text/vCard').registered?)
            assert(MIME::Type.new('application/pkcs7-mime').registered?)
        end

        def test_signature?
            assert(!MIME::Type.new('text/plain').signature?)
            assert(!MIME::Type.new('image/jpeg').signature?)
            assert(!MIME::Type.new('application/x-msword').signature?)
            assert(MIME::Type.new('text/vCard').signature?)
            assert(MIME::Type.new('application/pkcs7-mime').signature?)
        end

        def test_simplified
            assert_equal(MIME::Type.new('text/plain').simplified, 'text/plain')
            assert_equal(MIME::Type.new('image/jpeg').simplified, 'image/jpeg')
            assert_equal(MIME::Type.new('application/x-msword').simplified, 'application/msword')
            assert_equal(MIME::Type.new('text/vCard').simplified, 'text/vcard')
            assert_equal(MIME::Type.new('application/pkcs7-mime').simplified, 'application/pkcs7-mime')
        end

        def test_sub_type
            assert_equal(MIME::Type.new('text/plain').sub_type, 'plain')
            assert_equal(MIME::Type.new('image/jpeg').sub_type, 'jpeg')
            assert_equal(MIME::Type.new('application/x-msword').sub_type, 'x-msword')
            assert_equal(MIME::Type.new('text/vCard').sub_type, 'vCard')
            assert_equal(MIME::Type.new('application/pkcs7-mime').sub_type, 'pkcs7-mime')
        end

        def test_system
            yaml = MIME::Type.new(['text/x-yaml', ['yaml', 'yml'], '8bit',
                                'linux'])
            assert_equal(yaml.system, 'linux')
        end

        def test_to_s
            assert_equal("#{MIME::Type.new('text/plain')}", 'text/plain')
        end

        def test_s_new
            yaml = MIME::Type.new(['text/x-yaml', ['yaml', 'yml'], '8bit',
                                'linux'])
            assert_instance_of(MIME::Type, yaml)
            yaml = MIME::Type.new('Content-Type' => 'text/x-yaml',
                                  'Content-Transfer-Encoding' => '8bit',
                                  'System' => 'linux',
                                  'Extensions' => ['yaml', 'yml'])
            assert_instance_of(MIME::Type, yaml)
            yaml = MIME::Type.new('text/x-yaml') {
                init_extensions(['yaml', 'yml'])
                init_encoding('8bit')
                init_system('linux')
            }
            assert_instance_of(MIME::Type, yaml)
            assert_raises(MIME::InvalidContentType) { MIME::Type.new('apps') }
            assert_raises(TypeError) { MIME::Type.new(nil) }
        end

        def test_s_simplified
            assert_equal(MIME::Type.simplified('text/plain'), 'text/plain')
            assert_equal(MIME::Type.simplified('image/jpeg'), 'image/jpeg')
            assert_equal(MIME::Type.simplified('application/x-msword'), 'application/msword')
            assert_equal(MIME::Type.simplified('text/vCard'), 'text/vcard')
            assert_equal(MIME::Type.simplified('application/pkcs7-mime'), 'application/pkcs7-mime')
        end
    end

    class TestMIME__Types < Test::Unit::TestCase #:nodoc:
        def test_s_AREF # singleton method '[]'
            text_plain = MIME::Type.new('text/plain') {
                init_encoding('8bit')
                init_extensions(['asc', 'txt', 'c', 'cc', 'h', 'hh', 'cpp', 'hpp',
                                'dat', 'hlp'])
            }
            text_plain_vms = MIME::Type.new('text/plain') {
                init_encoding('8bit')
                init_extensions(['doc'])
                init_system('vms')
            }
            assert_equal(MIME::Types['text/plain'].sort,
                        [text_plain, text_plain_vms].sort)
            assert_equal(MIME::Types[/^image/].sort,
                        [MIME::Type.new(['image/bmp', ['bmp']]),
                        MIME::Type.new(['image/cgm']),
                        MIME::Type.new(['image/g3fax']),
                        MIME::Type.new(['image/gif', ['gif'], 'base64']),
                        MIME::Type.new(['image/ief', ['ief'], 'base64']),
                        MIME::Type.new(['image/jpeg', ['jpeg', 'jpg', 'jpe'],
                                        'base64']), 
                        MIME::Type.new(['image/naplps']),
                        MIME::Type.new(['image/png', ['png'], 'base64']),
                        MIME::Type.new(['image/prs.btif']),
                        MIME::Type.new(['image/prs.pti']),
                        MIME::Type.new(['image/tiff', ['tiff', 'tif'],
                                        'base64']),
                        MIME::Type.new(['image/vnd.cns.inf2']),
                        MIME::Type.new(['image/vnd.dgn', ['dgn']]),
                        MIME::Type.new(['image/vnd.dwg', ['dwg']]),
                        MIME::Type.new(['image/vnd.dxf']),
                        MIME::Type.new(['image/vnd.fastbidsheet']),
                        MIME::Type.new(['image/vnd.fpx']),
                        MIME::Type.new(['image/vnd.fst']),
                        MIME::Type.new(['image/vnd.fujixerox.edmics-mmr']),
                        MIME::Type.new(['image/vnd.fujixerox.edmics-rlc']),
                        MIME::Type.new(['image/vnd.mix']),
                        MIME::Type.new(['image/vnd.net-fpx']),
                        MIME::Type.new(['image/vnd.svf']),
                        MIME::Type.new(['image/vnd.wap.wbmp', ['wbmp']]),
                        MIME::Type.new(['image/vnd.xiff']),
                        MIME::Type.new(['image/x-cmu-raster', ['ras']]),
                        MIME::Type.new(['image/x-portable-anymap', ['pnm'],
                                        'base64']),
                        MIME::Type.new(['image/x-portable-bitmap', ['pbm'],
                                        'base64']),
                        MIME::Type.new(['image/x-portable-graymap', ['pgm'],
                                        'base64']),
                        MIME::Type.new(['image/x-portable-pixmap', ['ppm'],
                                        'base64']),
                        MIME::Type.new(['image/x-rgb', ['rgb'], 'base64']),
                        MIME::Type.new(['image/x-xbitmap', ['xbm'], '7bit']),
                        MIME::Type.new(['image/x-xpixmap', ['xpm'], '8bit']),
                        MIME::Type.new(['image/x-xwindowdump', ['xwd'],
                                        'base64']),
                        MIME::Type.new(['image/x-paintshoppro', ['psp'],
                                        'base64'])].sort)
        end

        def test_s_add
            eruby = MIME::Type.new("application/x-eruby") {
                init_extensions("rhtml")
                init_encoding("8bit")
            }

            MIME::Types.add(eruby)

            assert_equal(MIME::Types['application/x-eruby'], [eruby])
        end

        def test_s_of
            assert_equal(MIME::Types.type_for('xml'), 'text/xml')
            assert_equal(MIME::Types.type_for('gif'), 'image/gif')
            assert_nil(MIME::Types.type_for('xhtml'))
        end

        def test_s_type_for
            assert_equal(MIME::Types.of('xml'), 'text/xml')
            assert_equal(MIME::Types.of('gif'), 'image/gif')
            assert_nil(MIME::Types.of('xhtml'))
        end
    end
end
