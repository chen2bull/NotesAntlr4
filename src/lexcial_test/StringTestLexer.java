// Generated from StringTest.g4 by ANTLR 4.5.2
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class StringTestLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.5.2", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		STRING=1, SPACE=2;
	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"STRING", "SPACE", "ESC"
	};

	private static final String[] _LITERAL_NAMES = {
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "STRING", "SPACE"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public StringTestLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "StringTest.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u0430\ud6d1\u8206\uad2d\u4417\uaef1\u8d80\uaadd\2\4\"\b\1\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\3\2\3\2\3\2\7\2\r\n\2\f\2\16\2\20\13\2\3\2\3\2\3\3\3\3"+
		"\5\3\26\n\3\3\3\5\3\31\n\3\3\3\3\3\3\4\3\4\3\4\3\4\5\4!\n\4\3\16\2\5\3"+
		"\3\5\4\7\2\3\2\3\4\2\13\13\"\"%\2\3\3\2\2\2\2\5\3\2\2\2\3\t\3\2\2\2\5"+
		"\30\3\2\2\2\7 \3\2\2\2\t\16\7$\2\2\n\r\5\7\4\2\13\r\13\2\2\2\f\n\3\2\2"+
		"\2\f\13\3\2\2\2\r\20\3\2\2\2\16\17\3\2\2\2\16\f\3\2\2\2\17\21\3\2\2\2"+
		"\20\16\3\2\2\2\21\22\7$\2\2\22\4\3\2\2\2\23\31\t\2\2\2\24\26\7\17\2\2"+
		"\25\24\3\2\2\2\25\26\3\2\2\2\26\27\3\2\2\2\27\31\7\f\2\2\30\23\3\2\2\2"+
		"\30\25\3\2\2\2\31\32\3\2\2\2\32\33\b\3\2\2\33\6\3\2\2\2\34\35\7^\2\2\35"+
		"!\7$\2\2\36\37\7^\2\2\37!\7^\2\2 \34\3\2\2\2 \36\3\2\2\2!\b\3\2\2\2\b"+
		"\2\f\16\25\30 \3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}