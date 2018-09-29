package edu.calvin.cs262.tpt3.homework1;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    private EditText mFirstValue;
    private EditText mSecondValue;
    private TextView mResult;
    private String mOperator;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mFirstValue = (EditText) findViewById(R.id.value_one);
        mSecondValue = (EditText) findViewById(R.id.value_two);
        mResult = (TextView) findViewById(R.id.result);
    }
    public void displayToast(String message) {
        Toast.makeText(getApplicationContext(), message,
                Toast.LENGTH_SHORT).show();
    }
    public void onRadioButtonClicked(View view) {
        // Is the button now checked?
        boolean checked = ((RadioButton) view).isChecked();
        // Check which radio button was clicked
        switch(view.getId()) {
            case R.id.add:
                if (checked)
                    displayToast("Add");
                    mOperator = "add";
                break;
            case R.id.subtract:
                if (checked)
                    displayToast("Subtract");
                    mOperator = "subtract";
                break;
            case R.id.divide:
                if (checked)
                    displayToast("Divide");
                    mOperator = "divide";
                break;
            case R.id.multiply:
                if (checked)
                    displayToast("Multiply");
                    mOperator = "multiply";
                break;
            default:
                displayToast("No operator selected");
                break;
        }
    }
    public void calculate(View view){
        int first = Integer.parseInt(mFirstValue.getText().toString());
        int second = Integer.parseInt(mSecondValue.getText().toString());
        String result;
        switch (mOperator) {
            case "add":
                result = Integer.toString(first + second);
                break;
            case "subtract":
                result = Integer.toString(first - second);
                break;
            case "multiply":
                result = Integer.toString(first * second);
                break;
            case "divide":
                // nearest whole number, remainder not shown
                result = Integer.toString(first / second);
                break;
            default:
                result = "Result";
                break;
        }
        mResult.setText(result);
    }
}
