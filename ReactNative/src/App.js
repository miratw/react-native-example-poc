/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow strict-local
 */

import React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  ImageBackground,
  Platform,
  Button,
} from 'react-native';

import { EventBus } from './NativeModule/EventBus';

export default class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = { nativeResponse: "" }
  }

  callNative = async () => {
    var eventBus = new EventBus();
    var nativeResponse = await eventBus.callNative({ event: 'Birthday Party', parameter:  {'name': 'Test'}});
    console.log("Native Response: " + nativeResponse);
    this.setState(state => ({
      nativeResponse: nativeResponse
    }));
  } 


  render() {
    return (
      <>
        <StatusBar barStyle="dark-content" />
        <View style={styles.tabbar}>
          <Text style={styles.tabbarText}>Title</Text>
        </View>
        <SafeAreaView>
          <ScrollView
            contentInsetAdjustmentBehavior="automatic"
            style={styles.scrollView}>
            <Text style={styles.sectionTitle}>Welcome to React Native Web</Text>
            {global.HermesInternal == null ? null : (
              <View style={styles.engine}>
                <Text style={styles.footer}>Engine: Hermes</Text>
              </View>
            )}
            <Text>This should work on iOS, Android and Web</Text>
            <Text>Adding a new element works both on iOS, Android, and Web</Text>
            <Button title="Send event to native" onPress={this.callNative}></Button>
            <Text>Native Response: {this.state.nativeResponse} </Text>
          </ScrollView>
        </SafeAreaView>
      </>
    );
  }
};

const Colors = {
  
}

const styles = StyleSheet.create({
  scrollView: {
    // backgroundColor: Colors.lighter,
  },
  tabbar: {
    height: (Platform.OS === 'web') ? 40 : 50,
    backgroundColor: "#FF0000"
  },
  tabbarText: {
    top: (Platform.OS === 'web') ? 0 : 24,
  },
  engine: {
    position: 'absolute',
    right: 0,
  },
  body: {
    // backgroundColor: Colors.white,
  },
  sectionContainer: {
    marginTop: 32,
    paddingHorizontal: 24,
  },
  sectionTitle: {
    fontSize: 24,
    fontWeight: '600',
    // color: Colors.black,
  },
  sectionDescription: {
    marginTop: 8,
    fontSize: 18,
    fontWeight: '400',
    // color: Colors.dark,
  },
  highlight: {
    fontWeight: '700',
  },
  footer: {
    // color: Colors.dark,
    fontSize: 12,
    fontWeight: '600',
    padding: 4,
    paddingRight: 12,
    textAlign: 'right',
  },
});
