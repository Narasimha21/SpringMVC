package trng.imcs.spring.mvc.formatter;

import java.text.DateFormat;
import java.text.ParseException;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.util.StringUtils;

public class CustomSQLDateEditor extends CustomDateEditor {

	private DateFormat dateFormat;
	private int exactDateLength;
	private boolean allowEmpty;
	
	public CustomSQLDateEditor(DateFormat dateFormat, boolean allowEmpty) {
		super(dateFormat, allowEmpty);
		this.dateFormat = dateFormat;
		this.allowEmpty = allowEmpty;
	}
	
	public CustomSQLDateEditor(DateFormat dateFormat, boolean allowEmpty, int exactDateLength) {
		super(dateFormat, allowEmpty, exactDateLength);
		this.dateFormat = dateFormat;
		this.allowEmpty = allowEmpty;
		this.exactDateLength = exactDateLength;
	}
	
	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if (!StringUtils.isEmpty(text)) {
			// Treat empty String as null value.
			setValue(null);
		} else if (text != null && text.length() != this.exactDateLength) {
			throw new IllegalArgumentException(
				"Could not parse date: it is not exactly" + this.exactDateLength + "characters long");
		} else {
			try {
				java.util.Date date=dateFormat.parse(text);
				java.sql.Date sqlDate=new java.sql.Date(date.getTime());
				setValue(sqlDate);
			} catch (ParseException ex) {
				throw new IllegalArgumentException("Could not parse date: " + ex.getMessage());
			}
		}
	}

}
