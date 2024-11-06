#include <bits/stdc++.h>
using namespace std;

string generateCRC(string message, string divisor){
    int m=message.size();
    int n=divisor.size();
    string dividend=message;
    for(int i=0; i<n-1; i++) dividend+='0';
    for(int i=0; i<m; i++){
        if(dividend[i]=='1'){
            for(int j=0; j<n; j++){
                dividend[i+j]=dividend[i+j]==divisor[j]?'0':'1';
            }
        }
    }
    for(int i=m; i<dividend.size(); i++){
        message+=dividend[i];
    }
    return message;
}

bool findError(string receivedData, string divisor){
    string crc=generateCRC(receivedData, divisor);
    int m=receivedData.size();

    for(int i=m; i<crc.size(); i++){
        if(crc[i]=='1') return true;
    }
    return false;
}

int main(){
    string message, divisor, receivedData;
    cout<<"Enter the message: ";
    cin>>message;
    cout<<"Enter the divisor: ";
    cin>>divisor;
    string crc=generateCRC(message, divisor);
    // cout<<"CRC: "<<crc<<endl;
    cout<<"Enter received data: ";
    cin>>receivedData;
    if(findError(receivedData, divisor)) cout<<"Error detected\n";
    else cout<<"No error detected\n";
}