import tensorflow as tf
import keras
from keras import layers
from keras.datasets import cifar100
from keras.models import Sequential
import numpy as np


# from tensorflow.keras.models import Sequential
from keras.layers import Dense, Flatten, Conv2D, MaxPooling2D
from keras.utils import to_categorical


# Load CIFAR-10 dataset
(x_train, y_train), (x_test, y_test) = cifar100.load_data()

# Normalize pixel values to be between 0 and 1
x_train = x_train / 255.0
x_test = x_test / 255.0

# Define the model architecture
model = keras.Sequential([
    layers.Conv2D(32, (3, 3), activation='ELU', input_shape=(32, 32, 3)),
    layers.MaxPooling2D((2, 2)),
    layers.Conv2D(64, (3, 3), activation='ELU'),
    layers.MaxPooling2D((2, 2)),
    layers.Conv2D(64, (3, 3), activation='ELU'),
    layers.Flatten(),
    layers.Dense(64, activation='ELU'),
    layers.Dense(100)
])

# Compile the model
model.compile(optimizer='adam',
              loss=tf.keras.losses.SparseCategoricalCrossentropy(from_logits=True),
              metrics=['accuracy'])

# Train the model
history = model.fit(x_train, y_train, epochs=10,
                    validation_data=(x_test, y_test))

# Evaluate the model on test set
test_loss, test_acc = model.evaluate(x_test, y_test, verbose=2)
print('Test accuracy:', test_acc)




