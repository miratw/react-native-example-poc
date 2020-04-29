import { NativeModules } from 'react-native';

export class EventBus {
    callNative = async () => {
        var eventBus = NativeModules.EventBus;
        return eventBus.request({ event: 'Birthday Party', parameter:  {'name': 'Test'}});
    }
}