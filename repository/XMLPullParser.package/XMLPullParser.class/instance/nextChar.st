streaming
nextChar
	"Return the next character from the current input stream. If the current stream is at end pop to next nesting level if there is one.
	Due to the potential nesting of original document, included documents and replacment texts the streams are held in a stack representing the nested streams. The current stream is the top one."

	| nextChar |
	peekChar ifNil: 
			[nestedStreams ifNotNil: [self checkNestedStream].
			^ nextChar := stream next]
		ifNotNil: 
			[nextChar := peekChar.
			peekChar := nil.
			^ nextChar]